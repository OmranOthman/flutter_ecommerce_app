import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class AppBarThemeCustom {
  static AppBarTheme buildLightAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.lightModeScaffoldBackgroundColor,
      iconTheme: IconThemeData(
        color: AppColors.black,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.black,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.black ,
        fontFamily: "Plus Jakarta Sans",
      ),
    );
  }

  static AppBarTheme buildDarkAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.darkModeScaffoldBackgroundColor,
      iconTheme: IconThemeData(
        color: AppColors.darkModeWhiteColor,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.darkModeWhiteColor,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkModeWhiteColor,
        fontFamily: "Plus Jakarta Sans",
      ),
    );
  }
}