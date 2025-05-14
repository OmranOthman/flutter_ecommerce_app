import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/app/theme/text_theme.dart';
import 'package:flutter_ecommerce_app/core/constans/app_colors.dart';

class DarkThemeMode {
  static ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark(useMaterial3: true);
    final TextTheme textTheme = TextThemeMode.buildTextTheme(
      base.textTheme,
      AppThemeData.darkTheme,
    );
    const IconThemeData iconThemeData =
        IconThemeData(color: AppColors.darkModeWhiteColor);

    return base.copyWith(
      brightness: Brightness.dark,
      primaryColorDark: AppColors.darkModePrimaryColor,
      scaffoldBackgroundColor: AppColors.darkModeScaffoldBackgroundColor,
      cardTheme: const CardTheme(
        color: AppColors.darkModeCardColor,
        elevation: 3,
      ),
      iconTheme: iconThemeData,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkModePrimaryColor,
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.mojoColor,
        textColor: AppColors.whiteColor,
        textStyle: textTheme.bodySmall,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkModePrimaryColor,
        indicatorColor: AppColors.darkModeWhiteColor,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return iconThemeData.copyWith(
                  color: AppColors.darkModePrimaryColor);
            }
            return iconThemeData;
          },
        ),
        labelTextStyle: MaterialStatePropertyAll(
          textTheme.labelSmall?.copyWith(color: AppColors.darkModeWhiteColor),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(),
      ),
      textTheme: textTheme,
    );
  }
}
