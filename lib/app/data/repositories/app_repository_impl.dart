import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/data/datasources/app_local_data_source.dart';
import 'package:flutter_ecommerce_app/app/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  AppLocalDataSource appLocalDataSource;
  AppRepositoryImpl({
    required this.appLocalDataSource,
  });

  @override
  ThemeMode get getThemeMode {
    if (appLocalDataSource.isAppThemeMode) {
      if (appLocalDataSource.isDarkMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Future<ThemeMode> changeThemeMode(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.dark) {
      await appLocalDataSource.saveAppThemeMode();
      await appLocalDataSource.saveDarkMode();
      return ThemeMode.dark;
    } else if (themeMode == ThemeMode.light) {
      await appLocalDataSource.saveAppThemeMode();
      await appLocalDataSource.removeDarkTheme();
      return ThemeMode.light;
    } else {
      await appLocalDataSource.removeAppThemeMode();
      await appLocalDataSource.removeDarkTheme();
      return ThemeMode.system;
    }
  }

  @override
  Future<void> changeLanguage(Locale locale) async {
    if (locale.languageCode == 'en') {
      await appLocalDataSource.removeAppLanguage();
    } else if (locale.languageCode == 'ar') {
      await appLocalDataSource.saveAppLanguage('ar');
    }
  }

  @override
  Locale get getLanguage => Locale(appLocalDataSource.appLanguage);
}
