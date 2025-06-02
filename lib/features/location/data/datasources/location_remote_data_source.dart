
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class LocationRemoteDataSource {
  Future<List<void>> fetchLocations();
  Future<void> addLocation(String address);
  Future<void> confirmAddress(String locationId);
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Dio dio;

  LocationRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<void>> fetchLocations() async {
    try {
      final response = await dio.get('');
      if (response.statusCode == 200) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<void> addLocation(String address) async {
    try {
      final response = await dio.post('/user/locations', data: {'address': address});
      if (response.statusCode != 201) {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<void> confirmAddress(String locationId) async {
    try {
      final response = await dio.post('/user/confirm-location', data: {'locationId': locationId});
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}