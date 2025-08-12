import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
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
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

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
  bool get hasToken => authLocalDataSource.hasToken;

  @override
  Future<ApiResult<Map<String, dynamic>, Failure>> getRememberedData() async {
    try {
      Map<String, dynamic> rememberedData = {
        AppString.userPhone: authLocalDataSource.userPhone,
        AppString.password: authLocalDataSource.password,
        AppString.rememberMe: authLocalDataSource.rememberedButton
      };
      return ApiResult.withSuccess(rememberedData);
    } on CacheException {
      return ApiResult.withError(CacheFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<AuthResponse, Failure>> login({
    required bool rememberMe,
    required String phoneCode,
    required String phone,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        AuthResponse authResponse = await authRemoteDataSource.login(
          phone: phoneCode + phone,
          password: password,
        );
        if (authResponse.token != null) {
          await authLocalDataSource.saveToken(authResponse.token!);
        }
        if (rememberMe) {
          authLocalDataSource.savePassword(password);
          authLocalDataSource.saveRememberedButton(rememberMe);
          authLocalDataSource.saveUserPhone(phone);
        } else {
          authLocalDataSource.removeUserPhone();
          authLocalDataSource.removePassword();
          authLocalDataSource.removeRememberedButton();
        }

        return ApiResult.withSuccess(authResponse);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
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
          registerRequestModel: RegisterRequestModel.fromEntity(registerEntity),
        );
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> phoneVerify({
    required String fullPhone,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await authRemoteDataSource.phoneVerify(
          fullPhone: fullPhone,
          otp: otp,
        );
        await authLocalDataSource.saveToken(token);
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
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
        final msg = await authRemoteDataSource.resendCode(fullPhone: fullPhone);
        return ApiResult.withSuccess(msg);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> resetPassword({
    required String fullPhone,
    required String password,
    required String passwordConfirmation,
    required String token,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.resetPassword(
          fullPhone: fullPhone,
          password: password,
          passwordConfirmation: passwordConfirmation,
          token: token,
        );
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
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
      try {
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<String, Failure>> verifyOtp({
    required String fullPhone,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final token = await authRemoteDataSource.verifyOtp(
          fullPhone: fullPhone,
          otp: otp,
        );
        return ApiResult.withSuccess(token);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
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
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> forgetPassword({
    required String fullPhone,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.forgetPassword(fullPhone: fullPhone);
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }
}
