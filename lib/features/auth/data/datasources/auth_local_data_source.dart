import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveFirstTimeOpenApp();
  bool get isFirstTimeOpenApp;
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveFirstTimeOpenApp() async =>
      await sharedPreferences.setBool(AppString.firstTimeOpenApp, true);

  @override
  bool get isFirstTimeOpenApp =>
      sharedPreferences.getBool(AppString.firstTimeOpenApp) ?? false;
}
