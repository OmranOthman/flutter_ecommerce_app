import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveFirstTimeOpenApp();

  bool get isFirstTimeOpenApp;

  bool get hasToken;

  String? get userPhone;
  String? get password;
  bool get rememberedButton;

  Future<void> saveUserPhone(String userPhone);
  Future<void> savePassword(String password);
  Future<void> saveRememberedButton(bool rememberedButton);

  Future<void> removeUserPhone();
  Future<void> removePassword();
  Future<void> removeRememberedButton();

  Future<void> saveToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveFirstTimeOpenApp() async =>
      await sharedPreferences.setBool(AppString.firstTimeOpenApp, false);

  @override
  bool get isFirstTimeOpenApp =>
      sharedPreferences.getBool(AppString.firstTimeOpenApp) ?? true;

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(AppString.token, token);
  }

  @override
  bool get hasToken {
    String? token = sharedPreferences.getString(AppString.token);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> savePassword(String password) async {
    await sharedPreferences.setString(AppString.password, password);
  }

  @override
  Future<void> saveRememberedButton(bool rememberedButton) async {
    await sharedPreferences.setBool(AppString.rememberMe, rememberedButton);
  }

  @override
  Future<void> saveUserPhone(String userPhone) async {
    await sharedPreferences.setString(AppString.userPhone, userPhone);
  }

  @override
  String? get password => sharedPreferences.getString(AppString.password);

  @override
  bool get rememberedButton =>
      sharedPreferences.getBool(AppString.rememberMe) ?? false;

  @override
  String? get userPhone => sharedPreferences.getString(AppString.userPhone);

  @override
  Future<void> removePassword() async {
    await sharedPreferences.remove(AppString.password);
  }

  @override
  Future<void> removeRememberedButton() async {
    await sharedPreferences.remove(AppString.rememberMe);
  }

  @override
  Future<void> removeUserPhone() async {
    await sharedPreferences.remove(AppString.userPhone);
  }
}
