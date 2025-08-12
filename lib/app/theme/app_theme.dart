import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/theme/dark_theme.dart';

import 'package:flutter_ecommerce_app/app/theme/light_theme.dart';

class AppTheme {
  static Map<AppThemeData, ThemeData> theme(BuildContext context,
          {required Locale lang}) =>
      {
        AppThemeData.lightTheme:
            LightThemeMode.buildLightTheme(context, lang: lang),
        AppThemeData.darkTheme:
            DarkThemeMode.buildDarkTheme(context, lang: lang),
      };
}

enum AppThemeData {
  lightTheme,
  darkTheme,
}
