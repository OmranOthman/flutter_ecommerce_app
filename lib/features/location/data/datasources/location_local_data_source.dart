
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocationLocalDataSource {
  Future<List<void>> getLocations();
  Future<void> cacheLocations(List<void> locations);
  Future<void> selectLocation(String locationId);
  Future<void> getSelectedLocationId();
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocationLocalDataSourceImpl({
    required this.sharedPreferences,
  });



  @override
  Future<void> cacheLocations(List<void> locations) async {

  }
  

  @override
  Future<List<dynamic>> getLocations() {
    // TODO: implement getLocations
    throw UnimplementedError();
  }

  @override
  Future<void> getSelectedLocationId() {
    // TODO: implement getSelectedLocationId
    throw UnimplementedError();
  }

  @override
  Future<void> selectLocation(String locationId) {
    // TODO: implement selectLocation
    throw UnimplementedError();
  }
}