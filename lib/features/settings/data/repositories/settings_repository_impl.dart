import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/profile_model.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/recharge_wallet_request_model.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/entities/profile_entity.dart';
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
        await localDataSource.removeToken();
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
  Future<ApiResult<ProfileEntity, Failure>> getMyProfile() async {
    if (await networkInfo.isConnected) {
      try {
        ProfileEntity profile = await remoteDataSource.fetchMyProfile();

        return ApiResult.withSuccess(profile);
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
  Future<ApiResult<String, Failure>> getMyWallet() async {
    if (await networkInfo.isConnected) {
      try {
        String wallet = await remoteDataSource.fetchMyWallet();

        return ApiResult.withSuccess(wallet);
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
  Future<ApiResult<void, Failure>> editMyProfile(
      {required ProfileEntity profileEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.editProfile(
            profileModel: ProfileModel.fromEntity(
          profileEntity,
        ));

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
  Future<ApiResult<void, Failure>> updateNotificationPreferences(
      bool enabled) async {
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

  @override
  Future<ApiResult<void, Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.changePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
            passwordConfirmation: passwordConfirmation);

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
  Future<ApiResult<void, Failure>> rechargeWallet({
    required RechargeWalletRequestModel model,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.rechargeWallet(model: model);
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
  Future<ApiResult<InfoModel, Failure>> getAppSettings() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.fetchAppSettings();
        return ApiResult.withSuccess(result);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    } else {
      return ApiResult.withError(InternetConnectionFailure());
    }
  }


}
