import 'package:flutter_ecommerce_app/app/routers/app_router.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class UnAuthenticatedError {
  Future<void> removeToken();
  void backToSplashScreen();
}

class UnAuthenticatedErrorImpl implements UnAuthenticatedError {
  SharedPreferences sharedPreferences;
  UnAuthenticatedErrorImpl({required this.sharedPreferences});

  @override
  Future<void> removeToken() async {
    await sharedPreferences.remove(AppString.token);
  }

  @override
  void backToSplashScreen() {
    AppRouter.navigator.pushNamedAndRemoveUntil(
      RoutePath.splashRoute,
      (route) => false,
    );
  }
}
