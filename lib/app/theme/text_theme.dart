import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(TextTheme base, AppThemeData appTheme,
      Locale lang, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = screenWidth / 375;

    return base.copyWith(
      headlineLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 24 * scaleFactor.clamp(0.8, 1.4)
            : 22 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 21 * scaleFactor.clamp(0.8, 1.4)
            : 19 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeNavyBlueTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 18 * scaleFactor.clamp(0.8, 1.4)
            : 16 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 14 * scaleFactor.clamp(0.8, 1.4)
            : 13 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 13 * scaleFactor.clamp(0.8, 1.4)
            : 12 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 12 * scaleFactor.clamp(0.8, 1.4)
            : 11 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeDeepGrayTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 16 * scaleFactor.clamp(0.8, 1.4)
            : 15 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 15 * scaleFactor.clamp(0.8, 1.4)
            : 14 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeGrayTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: lang.languageCode == "en"
            ? 14 * scaleFactor.clamp(0.8, 1.4)
            : 13 * scaleFactor.clamp(0.8, 1.4),
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
    );
  }
}
