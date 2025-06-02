import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class LocationRepository {
  Future<ApiResult<List<void>, Failure>> fetchLocations();
  Future<ApiResult<void, Failure>> addLocation(String address);
  Future<ApiResult<void, Failure>> selectLocation(String locationId);
  Future<ApiResult<void, Failure>> confirmAddress();
}