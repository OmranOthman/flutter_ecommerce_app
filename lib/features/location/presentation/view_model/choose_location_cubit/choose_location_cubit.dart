import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/location_item_model.dart';

part 'choose_location_state.dart';

class ChooseLocationCubit extends Cubit<ChooseLocationState> {
  ChooseLocationCubit() : super(ChooseLocationInitial());

  String? selectedLocationId;
  LocationItemModel? selectedLocation;

  Future<void> fetchLocations() async {
    emit(FetchingLocations());
    try {
      for (var location in dummyLocations) {
        if (location.isChosen) {
          selectedLocationId = location.id;
          selectedLocation = location;
        }
      }
      selectedLocationId ??= dummyLocations.first.id;
      selectedLocation ??= dummyLocations.first;

      emit(FetchedLocations(List.from(dummyLocations)));
      emit(LocationChosen(selectedLocation!));
    } catch (e) {
      emit(FetchLocationsFailure(e.toString()));
    }
  }

  Future<void> addLocation(String location) async {
    emit(AddingLocation());
    try {
      final splittedLocations = location.split('-');
      final locationItem = LocationItemModel(
        id: DateTime.now().toIso8601String(),
        city: splittedLocations[0],
        country: splittedLocations[1],
      );
      dummyLocations.add(locationItem);
      emit(LocationAdded());
      emit(FetchedLocations(List.from(dummyLocations)));
    } catch (e) {
      emit(LocationAddingFailure(e.toString()));
    }
  }

  Future<void> selectLocation(String id) async {
    selectedLocationId = id;
    selectedLocation =
        dummyLocations.firstWhere((loc) => loc.id == id, orElse: () => dummyLocations.first);
    emit(LocationChosen(selectedLocation!));
  }

  Future<void> confirmAddress() async {
    emit(ConfirmAddressLoading());
    try {
      for (int i = 0; i < dummyLocations.length; i++) {
        dummyLocations[i] =
            dummyLocations[i].copyWith(isChosen: dummyLocations[i].id == selectedLocationId);
      }
      emit(ConfirmAddressLoaded());
    } catch (e) {
      emit(ConfirmAddressFailure(e.toString()));
    }
  }
}
