import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SettingsLocalDataSource {
  Future<void> clearUserData();
  Future<void> saveLanguagePreference(String languageCode);
  Future<void> saveNotificationPreference(bool enabled);
  String? get getLanguagePreference;
  String? get getToken;
  Future<void> removeToken();
  bool get getNotificationPreference;
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> clearUserData() async {
    await sharedPreferences.clear();
  }

  @override
  // TODO: implement getLanguagePreference
  String? get getLanguagePreference => throw UnimplementedError();

  @override
  // TODO: implement getNotificationPreference
  bool get getNotificationPreference => throw UnimplementedError();

  @override
  Future<void> saveLanguagePreference(String languageCode) {
    // TODO: implement saveLanguagePreference
    throw UnimplementedError();
  }

  @override
  Future<void> saveNotificationPreference(bool enabled) {
    // TODO: implement saveNotificationPreference
    throw UnimplementedError();
  }

  @override
  String? get getToken => sharedPreferences.getString(AppString.token);

  @override
  Future<void> removeToken() async =>
      await sharedPreferences.remove(AppString.token);
}
