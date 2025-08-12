import 'package:flutter/material.dart';

abstract interface class AppRepository {
  ThemeMode get getThemeMode;
  Locale get getLanguage;
  Future<ThemeMode> changeThemeMode(ThemeMode themeMode);
  Future<void> changeLanguage(Locale locale);
}
