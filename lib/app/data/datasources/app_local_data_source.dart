import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AppLocalDataSource {
  Future<void> saveAppThemeMode();
  Future<void> removeAppThemeMode();
  bool get isAppThemeMode;
  Future<void> saveDarkMode();
  Future<void> removeDarkTheme();
  bool get isDarkMode;
  Future<void> saveAppLanguage(String languageCode);
  Future<void> removeAppLanguage();
  String get appLanguage;
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final SharedPreferences sharedPreferences;
  AppLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveAppThemeMode() async =>
      await sharedPreferences.setBool(AppString.appThemeMode, true);

  @override
  Future<void> removeAppThemeMode() async =>
      await sharedPreferences.remove(AppString.appThemeMode);

  @override
  bool get isAppThemeMode =>
      sharedPreferences.getBool(AppString.appThemeMode) ?? false;

  @override
  Future<void> saveDarkMode() async =>
      await sharedPreferences.setBool(AppString.darkMode, true);

  @override
  Future<void> removeDarkTheme() async =>
      await sharedPreferences.remove(AppString.darkMode);

  @override
  bool get isDarkMode => sharedPreferences.getBool(AppString.darkMode) ?? false;

  @override
  Future<void> saveAppLanguage(String languageCode) =>
      sharedPreferences.setString(AppString.language, languageCode);
  @override
  Future<void> removeAppLanguage() async =>
      await sharedPreferences.remove(AppString.language);

  @override
  String get appLanguage =>
      sharedPreferences.getString(AppString.language) ?? 'en';
}
