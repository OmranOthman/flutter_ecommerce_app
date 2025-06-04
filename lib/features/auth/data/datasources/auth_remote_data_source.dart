import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> login({
    required String phone,
    required String password,
  });

  Future<void> register({
    required String fullName,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String phoneCode,
    required String countryCode,
  });

  Future<void> resetPassword({
    required String fullPhone,
    required String password,
    required String token,
  });

  Future<void> phoneVerify({
    required String fullPhone,
    required String otp,
  });

  Future<void> verifyOtp({
    required String fullPhone,
    required String otp,
  });

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });

  Future<void> userInfo({
    required String phone,
    required String birthday,
    required String gender,
    required String phoneCode,
    required String countryCode,
  });

//  Future<void> googleLogin({});
  Future<void> resendCode({
    required String fullPhone,
  });
// Future<ApiResult<void,Failure>> logout({});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dio});

  Dio dio;

  @override
  Future<String> login(
      {required String phone, required String password}) async {
    Response result = await dio.post("${AppString.apiUrl}login", data: {
      "full_phone": phone,
      "password": password,
    });
    if (result.statusCode == 200) {
      String token = result.data["token"];
      return token;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> register({
    required String fullName,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String phoneCode,
    required String countryCode,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}register",
      data: FormData.fromMap({
        "name": fullName,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "phone_code": phoneCode,
        "country_code": countryCode,
        "guest_uuid": '',
      }),
    );
    if (result.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    Response result =
        await dio.post("${AppString.apiUrl}change-password", data: {
      "current_password": currentPassword,
      "new_password": newPassword,
      "password_confirmation": passwordConfirmation,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> phoneVerify({
    required String fullPhone,
    required String otp,
  }) async {
    Response result = await dio.post("${AppString.apiUrl}phone-verify", data: {
      "full_phone": fullPhone,
      "otp": otp,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> resendCode({
    required String fullPhone,
  }) async {
    Response result = await dio.post("${AppString.apiUrl}verification", data: {
      "full_phone": fullPhone,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> resetPassword({
    required String fullPhone,
    required String password,
    required String token,
  }) async {
    Response result =
        await dio.post("${AppString.apiUrl}reset-password", data: {
      "full_phone": fullPhone,
      "password": password,
      "token": token,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> userInfo({
    required String phone,
    required String birthday,
    required String gender,
    required String phoneCode,
    required String countryCode,
  }) async {
    Response result = await dio.post("${AppString.apiUrl}user-info", data: {
      "phone": phone,
      "birthday": birthday,
      "gender": gender,
      "phone_code": phoneCode,
      "country_code": countryCode,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> verifyOtp({
    required String fullPhone,
    required String otp,
  }) async {
    Response result = await dio.post("${AppString.apiUrl}verify-otp", data: {
      "full_phone": fullPhone,
      "otp": otp,
    });
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }
}
