import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/theme/dark_theme.dart';

import 'package:flutter_ecommerce_app/app/theme/light_theme.dart';

class AppTheme {
  static Map<AppThemeData, ThemeData> theme = {
    AppThemeData.lightTheme: LightThemeMode.buildLightTheme(),
    AppThemeData.darkTheme: DarkThemeMode.buildDarkTheme(),
  };
}

enum AppThemeData {
  lightTheme,
  darkTheme,
}
