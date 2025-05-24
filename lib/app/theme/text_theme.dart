import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(TextTheme base, AppThemeData appTheme) {
    return base.copyWith(
      headlineLarge: TextStyle(
        fontFamily: "Cairo",
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Cairo",
        fontSize: 21.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeNavyBlueTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Cairo",
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Cairo",
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Cairo",
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Cairo",
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeDeepGrayTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Cairo",
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Cairo",
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeGrayTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Cairo",
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackTextColor,
      ),
    );
  }
}
