import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/core/constans/app_colors.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(TextTheme base, AppThemeData appTheme) {
    return base.copyWith(
      displayLarge: TextStyle(
        fontSize: 45,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 40,
        fontFamily: "Cairo",

        fontWeight: FontWeight.w600,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      displaySmall: TextStyle(
        fontFamily: "Cairo",

        fontSize: 38,
        fontWeight: FontWeight.w400,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: "Cairo",

        fontSize: 35,
        fontWeight: FontWeight.w800,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Cairo",

        fontSize: 28,

        fontWeight: FontWeight.w700,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeNavyBlueTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Cairo",

        fontSize: 28,
        fontWeight: FontWeight.w400,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: "Cairo",

        fontSize: 18,
        fontWeight: FontWeight.w700,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModePrimaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Cairo",

        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Cairo",

        fontSize: 14,
        fontWeight: FontWeight.w700,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeGrayTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Cairo",

        fontSize: 18,
        fontWeight: FontWeight.bold,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Cairo",

        fontSize: 16,
        fontWeight: FontWeight.w700,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Cairo",

        fontSize: 12,
        fontWeight: FontWeight.w700,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeDeepGrayTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Cairo",

        fontSize: 16,
        fontWeight: FontWeight.w800,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Cairo",

        fontSize: 16,
        fontWeight: FontWeight.w400,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeGrayTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Cairo",

        fontSize: 13,
        fontWeight: FontWeight.w500,
        color:
            AppThemeData.darkTheme == appTheme
                ? AppColors.darkModeWhiteColor
                : AppColors.lightModeBlackTextColor,
      ),
    );
  }
}
