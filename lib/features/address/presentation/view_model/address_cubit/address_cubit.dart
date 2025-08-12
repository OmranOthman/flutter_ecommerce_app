import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';
import 'package:flutter_ecommerce_app/features/address/domain/repositories/address_repository.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_state.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository addressRepository;

  AddressCubit({
    required this.addressRepository,
  }) : super(AddressState.init());

  Future<void> handleLocationPermission() async {
    emit(state.copyWith(mapIsLoading: true, mapController: MapController()));
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    emit(state.copyWith(
        mapIsLoading: false,
        latLng: LatLng(position.latitude, position.longitude),
        newAddress: state.newAddress!
            .copyWith(location: "${position.latitude},${position.longitude}")));

    // await _getAddressFromLatLng();
  }

  // Future<void> _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       state.latLng!.latitude,
  //       state.latLng!.longitude,
  //     );

  //     print("what is the ${placemarks.first.country}");

  //     print("what is the ${placemarks.first.locality}");

  //     emit(state.copyWith(
  //         newAddress:
  //             state.newAddress!.copyWith(country: placemarks.first.country),
  //         mapIsLoading: false));
  //   } catch (e) {
  //     emit(state.copyWith(permissionError: e.toString()));
  //     print('Error in geocoding: $e');
  //   }
  // }

  void selectLocation(LatLng position) {
    emit(state.copyWith(
        latLng: position,
        newAddress: state.newAddress!
            .copyWith(location: "${position.latitude},${position.longitude}")));

    // _getAddressFromLatLng(position);
  }

  void animateToLocation() {
    state.mapController!.move(
      state.latLng!,
      state.mapController!.camera.zoom,
    );
  }

  Future<void> getAddresses() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    await addressRepository.getAddresses().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            addresses: result.dataResponse!,
          ));
        }
      },
    );
  }

  void selectAddress(AddressModel? address) {
    emit(state.copyWith(selectedAddress: address));
  }

  void cityNameChanged(String value) =>
      emit(state.copyWith(newAddress: state.newAddress!.copyWith(city: value)));

  // void stateNameChanged(String value) => emit(
  //     state.copyWith(newAddress: state.newAddress!.copyWith(state: value)));

  void titleOnChanged(String value) => emit(
      state.copyWith(newAddress: state.newAddress!.copyWith(title: value)));

  void lineOneOnChanged(String value) => emit(
      state.copyWith(newAddress: state.newAddress!.copyWith(lineOne: value)));

  void floorOnChanged(String value) => emit(
      state.copyWith(newAddress: state.newAddress!.copyWith(floor: value)));

  void houseNumberOnChanged(String value) => emit(state.copyWith(
      newAddress: state.newAddress!.copyWith(houseNumber: value)));

  void setLocation(double lat, double lng) {
    emit(state.copyWith(
        newAddress: state.newAddress!.copyWith(location: "$lat,$lng")));
  }

  Future<void> addNewAddress() async {
    emit(state.copyWith(addAddressIsLoading: true));

    await addressRepository
        .addAddress(state.newAddress!.copyWith(
            countryId: state.selectedCountry!.id.toString(),
            country: state.selectedCountry!.name,
            stateId: state.selectedState!.id.toString(),
            state: state.selectedState!.name))
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            addAddressIsLoading: false,
            addAddressErrorMessage:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            addAddressIsLoading: false,
            saveSuccess: true,
          ));
        }
      },
    );
  }

  Future<void> deleteAddress(int addreesId) async {
    emit(state.copyWith(deleteAddressIsLoading: true));

    await addressRepository.deleteAddress(addreesId).then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            deleteAddressIsLoading: false,
            deleteAddressErrorMessage:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            deleteAddressIsLoading: false,
          ));
        }
      },
    );
  }

  Future<void> getCountries() async {
    emit(state.copyWith(countryIsLoading: true));
    await addressRepository.getCountries().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            countryIsLoading: false,
            countryErrorMessage: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          print("what is the ${result.dataResponse![0].name}");
          emit(state.copyWith(
            countryIsLoading: false,
            countries: result.dataResponse!,
          ));

          onCountryNameSelected(
              CountryModel(id: 167, name: "Oman", nativeName: "عمان"));
        }
      },
    );
  }

  Future<void> getStates(int countryId) async {
    emit(state.copyWith(stateIsLoading: true, states: []));
    await addressRepository.getStates(countryId).then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            stateIsLoading: false,
            stateErrorMessage: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            stateIsLoading: false,
            states: result.dataResponse!,
          ));
        }
      },
    );
  }

  void onCountryNameSelected(CountryModel? selectedCountry) {
    emit(state.copyWith(
      selectedCountry: selectedCountry,
    ));

    getStates(state.selectedCountry!.id!);
  }

  void onStateSelected(StateModel? selectedState) {
    emit(state.copyWith(
      selectedState: selectedState,
    ));
  }
}
