import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/dots_loading_indicator.dart';

class LanguageChangingPage extends StatefulWidget {
  const LanguageChangingPage({super.key});

  static Route<dynamic> route({RouteSettings? settings}) => MaterialPageRoute(
      settings: settings, builder: (context) => LanguageChangingPage());

  @override
  State<LanguageChangingPage> createState() => _LanguageChangingPageState();
}

class _LanguageChangingPageState extends State<LanguageChangingPage> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer(Durations.extralong4 * 1.5, () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutePath.splashRoute,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lightModePrimaryColor,
            // AppColors.eucalyptusColor,
            AppColors.eucalyptusColor,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
            DotsLoadingIndicator(
              count: 1,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
            ),
            Text(
              'changing_language'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
