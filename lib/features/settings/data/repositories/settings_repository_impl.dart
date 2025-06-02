import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;
  final SettingsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SettingsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<void, Failure>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout();
        await localDataSource.clearUserData();
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> changeLanguage(String languageCode) async {
    try {
      await localDataSource.saveLanguagePreference(languageCode);
      return ApiResult.withSuccess(null);
    } catch (error) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<void, Failure>> updateNotificationPreferences(bool enabled) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateNotificationPreferences(enabled);
        await localDataSource.saveNotificationPreference(enabled);
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }
}