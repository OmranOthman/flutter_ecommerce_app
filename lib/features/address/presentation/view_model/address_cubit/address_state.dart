import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';

class AddressState extends Equatable {
  final bool isLoading;
  final bool addAddressIsLoading;
  final bool deleteAddressIsLoading;
  final String? deleteAddressErrorMessage;
  final String? addAddressErrorMessage;
  final bool mapIsLoading;
  final bool saveSuccess;
  final String? errorMessage;
  final String? permissionErrorMessage;
  final AddressModel? newAddress;
  final LatLng? latLng;
  final MapController? mapController;
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;
  final List<CountryModel> countries;
  final List<StateModel> states;
  final CountryModel? selectedCountry;
  final StateModel? selectedState;
  final bool countryIsLoading;
  final bool stateIsLoading;
  final String? countryErrorMessage;
  final String? stateErrorMessage;

  AddressState({
    this.isLoading = false,
    this.mapIsLoading = false,
    this.saveSuccess = false,
    this.deleteAddressIsLoading = false,
    this.deleteAddressErrorMessage,
    this.errorMessage,
    List<AddressModel>? addresses,
    List<CountryModel>? countries,
    List<StateModel>? states,
    this.newAddress,
    this.selectedAddress,
    this.permissionErrorMessage,
    this.latLng,
    this.addAddressErrorMessage,
    this.addAddressIsLoading = false,
    this.mapController,
    this.selectedCountry,
    this.selectedState,
    this.countryIsLoading = false,
    this.stateIsLoading = false,
    this.countryErrorMessage,
    this.stateErrorMessage,
  })  : addresses = addresses ?? [],
        states = states ?? [],
        countries = countries ?? [];

  factory AddressState.init() => AddressState(
        addresses: List.empty(),
        states: List.empty(),
        countries: List.empty(),
        isLoading: false,
        saveSuccess: false,
        mapIsLoading: false,
        countryIsLoading: false,
        stateIsLoading: false,
        addAddressIsLoading: false,
        newAddress: AddressModel(
          country: "Oman",
          countryId: "167",
        ),
      );

  AddressState copyWith({
    bool? isLoading,
    bool? saveSuccess,
    String? errorMessage,
    List<AddressModel>? addresses,
    AddressModel? newAddress,
    AddressModel? selectedAddress,
    String? permissionErrorMessage,
    LatLng? latLng,
    bool? mapIsLoading,
    MapController? mapController,
    String? addAddressErrorMessage,
    bool? addAddressIsLoading,
    List<CountryModel>? countries,
    List<StateModel>? states,
    CountryModel? selectedCountry,
    StateModel? selectedState,
    bool? countryIsLoading,
    bool? stateIsLoading,
    String? countryErrorMessage,
    String? stateErrorMessage,
    bool? deleteAddressIsLoading,
    String? deleteAddressErrorMessage,
  }) {
    return AddressState(
      newAddress: newAddress ?? this.newAddress,
      isLoading: isLoading ?? this.isLoading,
      saveSuccess: saveSuccess ?? false,
      errorMessage: errorMessage,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      permissionErrorMessage: permissionErrorMessage,
      latLng: latLng ?? this.latLng,
      mapIsLoading: mapIsLoading ?? this.mapIsLoading,
      mapController: mapController ?? this.mapController,
      addAddressErrorMessage: addAddressErrorMessage,
      addAddressIsLoading: addAddressIsLoading ?? this.addAddressIsLoading,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      countryIsLoading: countryIsLoading ?? this.countryIsLoading,
      stateIsLoading: stateIsLoading ?? this.stateIsLoading,
      countryErrorMessage: countryErrorMessage,
      stateErrorMessage: stateErrorMessage,
      deleteAddressIsLoading:
          deleteAddressIsLoading ?? this.deleteAddressIsLoading,
      deleteAddressErrorMessage: deleteAddressErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        newAddress,
        isLoading,
        saveSuccess,
        errorMessage,
        addresses,
        selectedAddress,
        permissionErrorMessage,
        latLng,
        mapIsLoading,
        mapController,
        addAddressErrorMessage,
        addAddressIsLoading,
        countries,
        states,
        selectedCountry,
        selectedState,
        countryIsLoading,
        stateIsLoading,
        countryErrorMessage,
        stateErrorMessage,
        deleteAddressErrorMessage,
        deleteAddressIsLoading,
      ];
}
