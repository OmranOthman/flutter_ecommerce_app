import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/app_launch_cubit/app_launch_cubit.dart';
import 'package:flutter_ecommerce_app/features/bio_metriecs/helpers/bio_metric_storage_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';

class SplashPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashPage(),
      );

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AppLaunchCubit>(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late AppLaunchCubit appLaunchCubit;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    appLaunchCubit = BlocProvider.of<AppLaunchCubit>(context);

    appLaunchCubit.checkAppLaunchState();

    Timer(const Duration(seconds: 2), _handleNavigation);
  }

  Future<void> _handleNavigation() async {
    final state = appLaunchCubit.state;

    if (state.hasToken) {
      final biometricEnabled =
      await BiometricStorageHelper.isBiometricEnabled();

      if (biometricEnabled) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/biometric',
              (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePath.mainRoute,
              (route) => false,
        );
      }
    } else {
      if (state.checkIfFirstTimeOpenApp) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePath.onBoardingRoute,
              (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePath.loginRoute,
              (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo_splash.png",
                  width: 199.w,
                  height: 102.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Any shopping just from home",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.white70,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Version 0.0.1",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                  color: AppColors.white70,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}