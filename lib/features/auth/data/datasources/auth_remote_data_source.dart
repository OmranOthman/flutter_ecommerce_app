import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/auth/data/model/auth_response.dart';
import 'package:flutter_ecommerce_app/features/auth/data/model/register_request_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponse> login({
    required String phone,
    required String password,
  });

  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<void> resetPassword({
    required String fullPhone,
    required String password,
    required String passwordConfirmation,
    required String token,
  });

  Future<String> phoneVerify({
    required String fullPhone,
    required String otp,
  });

  Future<String> verifyOtp({
    required String fullPhone,
    required String otp,
  });

  Future<void> userInfo({
    required String phone,
    required String birthday,
    required String gender,
    required String phoneCode,
    required String countryCode,
  });

  Future<void> googleLogin();

  Future<String> resendCode({
    required String fullPhone,
  });

  Future<void> forgetPassword({
    required String fullPhone,
  });

// Future<ApiResult<void,Failure>> logout({});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(
      {required this.sharedPreferences,
      required this.dio,
      required this.googleSignin});

  Dio dio;
  SharedPreferences sharedPreferences;
  String? get language => sharedPreferences.getString(AppString.language);

  GoogleSignIn googleSignin;

  @override
  Future<AuthResponse> login(
      {required String phone, required String password}) async {
    Response result = await dio.post(
      "${AppString.apiUrl}login",
      data: {
        "full_phone": phone,
        "password": password,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      // bool isActive = result.data["success"];
      return AuthResponse.fromJson(result.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}register",
      data: registerRequestModel.toFormData(),
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      return;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> phoneVerify({
    required String fullPhone,
    required String otp,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}phone-verify",
      data: {
        "full_phone": fullPhone,
        "otp": otp,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      String token = result.data['token'];
      return token;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> resendCode({
    required String fullPhone,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}verification",
      data: {
        "full_phone": fullPhone,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      String msg = result.data["message"];
      return msg;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> resetPassword({
    required String fullPhone,
    required String password,
    required String passwordConfirmation,
    required String token,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}reset-password",
      data: {
        "full_phone": fullPhone,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "token": token,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      return;
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
    Response result = await dio.post(
      "${AppString.apiUrl}user-info",
      data: {
        "phone": phone,
        "birthday": birthday,
        "gender": gender,
        "phone_code": phoneCode,
        "country_code": countryCode,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> verifyOtp({
    required String fullPhone,
    required String otp,
  }) async {
    Response result = await dio.post(
      "${AppString.apiUrl}verify-otp",
      data: {
        "full_phone": fullPhone,
        "otp": otp,
      },
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (result.statusCode == 200) {
      return result.data['token'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> googleLogin() async {
    Response response = await dio.get("${AppString.apiUrl}login/google");
    if (response.statusCode != 200) {
      print('People API ${response.statusCode} response: ${response.data}');
      return;
    }
    // final Map<String, dynamic> data =
    // json.decode(response.date) as Map<String, dynamic>;
    //final String? namedContact = _pickFirstNamedContact(data);
  }

  @override
  Future<void> forgetPassword({required String fullPhone}) async {
    Response response = await dio.post(
      "${AppString.apiUrl}forgot-password",
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }
}
