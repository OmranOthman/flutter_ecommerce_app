import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/profile_model.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/recharge_wallet_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SettingsRemoteDataSource {
  Future<void> logout();
  Future<void> updateNotificationPreferences(bool enabled);
  Future<ProfileModel> fetchMyProfile();
  Future<String> fetchMyWallet();
  Future<void> editProfile({required ProfileModel profileModel});
  Future<void> rechargeWallet({required RechargeWalletRequestModel model});
  Future<InfoModel> fetchAppSettings();
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  SettingsRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.dio,
  });

  String? get token => sharedPreferences.getString(AppString.token);

  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<void> logout() async {
    Response response = await dio.post(
      "${AppString.apiUrl}logout",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<ProfileModel> fetchMyProfile() async {
    Response response = await dio.get(
      "${AppString.apiUrl}profile",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(
        response.data['data'],
      );
    }
    throw ServerException();
  }

  @override
  Future<String> fetchMyWallet() async {
    Response response = await dio.get(
      "${AppString.apiUrl}wallet-balance",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data['data']['balance'];
    }
    throw ServerException();
  }

  @override
  Future<void> editProfile({required ProfileModel profileModel}) async {
    FormData profileModelFormData = await profileModel.toFormData();
    Response response = await dio.post("${AppString.apiUrl}profile",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept-Language": language
          },
        ),
        data: profileModelFormData);
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    Response response = await dio.post("${AppString.apiUrl}change-password",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept-Language": language
          },
        ),
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
          "new_password_confirmation": passwordConfirmation
        });
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> updateNotificationPreferences(bool enabled) async {
    final response = await dio.put('notifications/preferences', data: {
      'enabled': enabled,
    });
    if (response.statusCode != 200) {}
    throw ServerException();
  }

  @override
  Future<void> rechargeWallet(
      {required RechargeWalletRequestModel model}) async {
    final response = await dio.post(
      "${AppString.apiUrl}recharge-wallet",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: model.toJson(),
    );

    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<InfoModel> fetchAppSettings() async {
    final response = await dio.get(
      "${AppString.apiUrl}app-settings",
      options: Options(
        headers: {
          "Accept-Language": language,
        },
      ),
    );

    if (response.statusCode == 200) {
      return InfoModel.fromJson(response.data);
    }
    throw ServerException();
  }

}
