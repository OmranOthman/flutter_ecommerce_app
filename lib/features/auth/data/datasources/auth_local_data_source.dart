import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveFirstTimeOpenApp();

  bool get isFirstTimeOpenApp;

  Future<void> login({required String email, required String password});
  Future<void> signup({required String fullName,required String email, required String password});
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

  @override
  Future<void> login({required String email, required String password}) async {}
  @override
  Future<void> signup({required String fullName,required String email, required String password}) async {}
}
