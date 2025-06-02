import 'package:shared_preferences/shared_preferences.dart';


abstract interface class SettingsLocalDataSource {
  Future<void> clearUserData();
  Future<void> saveLanguagePreference(String languageCode);
  Future<void> saveNotificationPreference(bool enabled);
  String? get getLanguagePreference;
  bool get getNotificationPreference;
}


class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> clearUserData() {
    // TODO: implement clearUserData
    throw UnimplementedError();
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

}