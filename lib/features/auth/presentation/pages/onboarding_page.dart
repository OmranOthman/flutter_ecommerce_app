import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_distances.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class OnboardingPage extends StatefulWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const OnboardingPage(),
      );
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page?.round() != currentPageNotifier.value) {
        currentPageNotifier.value = pageController.page?.round() ?? 0;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthCubit>(),
      child: OnboardingView(
        pageController: pageController,
        currentPageNotifier: currentPageNotifier,
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<int> currentPageNotifier;

  OnboardingView({
    super.key,
    required this.pageController,
    required this.currentPageNotifier,
  });

  final List<String> images = [
    AppAssets.images.onboarding1,
    AppAssets.images.onboarding2,
    AppAssets.images.onboarding3,
  ];


  final String titleText = "Various Collections Of The\nLatest Products";
  final String subtitleText =
      "Urn amet, suspense perambulator ac elit diam facilitates curses vestibule.";

  Widget _buildPageIndicator(BuildContext context, int currentPage) {
    List<Widget> indicators = [];
    for (int i = 0; i < images.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == i
                ? Theme.of(context).primaryColor
                : Colors.grey[400],
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    Size size = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDistances.extraLargePadding,
                      vertical: AppDistances.mediumPadding,
                    ),
                    height: size.height * 0.45,
                    child: PageView(
                      controller: pageController,
                      children: images
                          .map(
                            (image) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppDistances.largePadding),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: AppDistances.extraLargePadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDistances.largePadding),
                    child: Text(
                      titleText,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDistances.mediumPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDistances.extraLargePadding),
                    child: Text(
                      subtitleText,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(height: AppDistances.extraLargePadding),
                  ValueListenableBuilder<int>(
                    valueListenable: currentPageNotifier,
                    builder: (context, currentPageValue, child) {
                      return _buildPageIndicator(context, currentPageValue);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDistances.largePadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    onTap: () {
                      authCubit.saveFirstTimeOpenApp();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePath.registerRoute,
                            (route) => false,
                      );
                    },
                    text: "create_account".tr,
                  ),
                  SizedBox(height: AppDistances.mediumPadding),
                  TextButton(
                    onPressed: () {
                      authCubit.saveFirstTimeOpenApp();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePath.loginRoute,
                            (route) => false,
                      );
                    },
                    child: Text(
                      "already_have_an_account".tr,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}