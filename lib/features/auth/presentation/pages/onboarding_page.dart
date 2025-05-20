import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_distances.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class OnboardingPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const OnboardingPage(),
      );
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthCubit>(),
      child: OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final PageController pageController = PageController();
  final List<String> images = [
    AppAssets.images.onboarding1,
    AppAssets.images.onboarding2,
    AppAssets.images.onboarding3,
  ];

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(
                AppDistances.extraLargePadding,
              ),
              height: size.height * 0.5,
              child: PageView(
                controller: pageController,
                children: images
                    .map(
                      (image) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppDistances.largePadding),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            CustomButton(
                onTap: () {
                  if (pageController.page == images.length - 1) {
                    authCubit.saveFirstTimeOpenApp();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutePath.loginRoute,
                      (route) => false,
                    );
                  } else {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                  }
                },
                text: "Next")
          ],
        ),
      )),
    );
  }
}
