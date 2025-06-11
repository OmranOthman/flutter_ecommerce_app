import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(TextTheme base, AppThemeData appTheme) {
    return base.copyWith(
      headlineLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 21.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeNavyBlueTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeDeepGrayTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeGrayTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
    );
  }
}
