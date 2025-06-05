import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/app_launch_cubit/app_launch_cubit.dart';

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
      child: SplashView(),
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
  @override
  void initState() {
    super.initState();
    appLaunchCubit = BlocProvider.of<AppLaunchCubit>(context);
    Timer(
      Duration(seconds: 2),
      () => appLaunchCubit.checkIfFirstTimeOpenApp
          ? Navigator.of(context).pushNamedAndRemoveUntil(
              RoutePath.loginRoute,
              (route) => false,
            )
          : Navigator.of(context).pushNamedAndRemoveUntil(
              RoutePath.onBoardingRoute,
              (route) => false,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text("Wlecome"),
      ),
    );
  }
}
