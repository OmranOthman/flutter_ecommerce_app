import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constans/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constans/app_distances.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';

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
      create: (context) => di<OnBoardingCubit>(),
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
    OnBoardingCubit onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
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
                onPressed: () {
                  if (pageController.page == images.length - 1) {
                    onBoardingCubit.saveFirstTimeOpenApp();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.loginRoute,
                      (route) => false,
                    );
                  } else {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                  }
                },
                textButton: "Next")
          ],
        ),
      )),
    );
  }
}
