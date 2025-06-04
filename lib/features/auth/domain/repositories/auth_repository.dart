import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class AuthRepository {
  Future<void> saveFirstTimeOpenApp();

  bool get checkIfFirstTimeOpenApp;

  Future<ApiResult<void, Failure>> login({
    required String phone,
    required String password,
  });

  Future<ApiResult<void, Failure>> register({
    required String fullName,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String phoneCode,
    required String countryCode,
  });

  Future<ApiResult<void, Failure>> resetPassword({
    required String fullPhone,
    required String password,
    required String token,
  });

  Future<ApiResult<void, Failure>> phoneVerify({
    required String fullPhone,
    required String otp,
  });

  Future<ApiResult<void, Failure>> verifyOtp({
    required String fullName,
    required String otp,
  });

  Future<ApiResult<void, Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });

  Future<ApiResult<void, Failure>> userInfo({
    required String phone,
    required String birthday,
    required String gender,
    required String phoneCode,
    required String countryCode,
  });

//  Future<ApiResult<void,Failure>> googleLogin({});
  Future<ApiResult<void, Failure>> resendCode({
    required String fullPhone,
  });
// Future<ApiResult<void,Failure>> logout({});
}
