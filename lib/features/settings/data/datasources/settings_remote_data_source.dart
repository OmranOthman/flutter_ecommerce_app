import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';


abstract interface class SettingsRemoteDataSource {
  Future<void> logout();
  Future<void> updateNotificationPreferences(bool enabled);
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final Dio dio;

  SettingsRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> logout() async {
    try {
      final response = await dio.post('/logout');
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<void> updateNotificationPreferences(bool enabled) async {
    try {
      final response = await dio.put('/notifications/preferences', data: {
        'enabled': enabled,
      });
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}