import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
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
      Navigator.canPop(context) ? Navigator.pop(context) : null;
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
            AppColors.martiniqueColor,
            // AppColors.eucalyptusColor,
            AppColors.eucalyptusColor,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Image.asset(AppAssets.images.verification),
            DotsLoadingIndicator(
              count: 4,
              activeColor: AppColors.whiteColor,
              inactiveColor: AppColors.whiteColor.withOpacity(0.2),
            ),
            Text(
              'Changing Language',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.whiteColor),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
