import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/app/theme/text_theme.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_distances.dart';

class LightThemeMode {
  static ThemeData buildLightTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);

    final TextTheme textTheme = TextThemeMode.buildTextTheme(
      base.textTheme,
      AppThemeData.lightTheme,
    );
    const IconThemeData iconThemeData = IconThemeData(
      color: AppColors.lightModeWhiteColor,
      size: 24
    );

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.lightModePrimaryColor,
      scaffoldBackgroundColor: AppColors.lightModeScaffoldBackgroundColor,
      cardTheme: const CardTheme(
        color: AppColors.lightModeCardColor,
        elevation: 3,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightModePrimaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
     filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(
          fontSize: 14,
          height: 1,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightModeBorderColor),
          gapPadding: 0,
          borderRadius:
              BorderRadius.circular(AppDistances.textFieldBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightModeBorderColor),
          gapPadding: 0,
          borderRadius:
              BorderRadius.circular(AppDistances.textFieldBorderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightModeDeepGrayTextColor,
          ),
          gapPadding: 0,
          borderRadius:
              BorderRadius.circular(AppDistances.textFieldBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightModePrimaryColor),
          gapPadding: 0,
          borderRadius:
              BorderRadius.circular(AppDistances.textFieldBorderRadius),
        ),
      ),
      iconTheme: iconThemeData,
      expansionTileTheme: const ExpansionTileThemeData(shape: Border()),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.mojoColor,
        textColor: AppColors.whiteColor,
        textStyle: textTheme.bodySmall,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightModePrimaryColor,
        indicatorColor: AppColors.lightModeWhiteColor,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(MaterialState.selected)) {
            return iconThemeData.copyWith(
              color: AppColors.lightModePrimaryColor,
            );
          }
          return iconThemeData;
        }),
        labelTextStyle: MaterialStatePropertyAll(
          textTheme.labelSmall?.copyWith(color: AppColors.lightModeWhiteColor),
        ),
      ),
      textTheme: textTheme,
    );
  }
}
