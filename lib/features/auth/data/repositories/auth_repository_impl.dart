import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/model/auth_response.dart';
import 'package:flutter_ecommerce_app/features/auth/data/model/register_request_model.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/entities/register_entity.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  bool get checkIfFirstTimeOpenApp => authLocalDataSource.isFirstTimeOpenApp;

  @override
  Future<void> saveFirstTimeOpenApp() {
    return authLocalDataSource.saveFirstTimeOpenApp();
  }

  @override
  Future<ApiResult<AuthResponse, Failure>> login(
      {required String phone, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        AuthResponse authResponse =
            await authRemoteDataSource.login(phone: phone, password: password);
        // await authLocalDataSource.saveToken(token);
        return ApiResult.withSuccess(authResponse);
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
  Future<ApiResult<void, Failure>> register({
    required RegisterEntity registerEntity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.register(
            registerRequestModel:
                RegisterRequestModel.fromEntity(registerEntity));
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
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<void, Failure>> phoneVerify({
    required String fullPhone,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        String token = await authRemoteDataSource.phoneVerify(
            fullPhone: fullPhone, otp: otp);
            await authLocalDataSource.saveToken(token);
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
  Future<ApiResult<String, Failure>> resendCode({
    required String fullPhone,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        String msg =
            await authRemoteDataSource.resendCode(fullPhone: fullPhone);
        return ApiResult.withSuccess(msg);
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
  Future<ApiResult<void, Failure>> resetPassword({
    required String fullPhone,
    required String password,
    required String token,
  }) async {
    if (await networkInfo.isConnected) {
      try {} on DioException catch (error) {
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
  Future<ApiResult<void, Failure>> userInfo({
    required String phone,
    required String birthday,
    required String gender,
    required String phoneCode,
    required String countryCode,
  }) async {
    if (await networkInfo.isConnected) {
      try {} on DioException catch (error) {
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
  Future<ApiResult<void, Failure>> verifyOtp({
    required String fullName,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {} on DioException catch (error) {
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
  Future<ApiResult<void, Failure>> googleLogin() async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.googleLogin();
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
  Future<ApiResult<void, Failure>> forgetPassword(
      {required String fullPhone}) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.forgetPassword(fullPhone: fullPhone);
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
 
  bool get hasToken => authLocalDataSource.hasToken;
}
