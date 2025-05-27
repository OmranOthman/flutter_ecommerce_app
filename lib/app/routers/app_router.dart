import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/widgets/change_language.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/verification_page.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/pages/notifications_page.dart';
// import 'package:flutter_ecommerce_app/features/home/presentation/widget/custom_bottom_navbar.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/pages/main_page.dart';
import 'package:flutter_ecommerce_app/features/new_card/presentation/pages/add_new_card_page.dart';
import 'package:flutter_ecommerce_app/features/new_card/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_tracking_page.dart';
import 'package:flutter_ecommerce_app/features/product_details/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/setting_change_password_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/help_and_support_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/language_page.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:flutter_ecommerce_app/features/location/presentation/pages/choose_location_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/setting_edit_profile_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/legal_and_policies_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/setting_notification_page.dart';
import 'package:flutter_ecommerce_app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/security_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/settings_page.dart';

import 'route_error_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Getting agrs passed in while calling Navigastor.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case RoutePath.splashRoute:
        return SplashPage.route(settings: settings);

      case RoutePath.onBoardingRoute:
        return OnboardingPage.route(settings: settings);
      // case RoutePath.homeRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const CustomBottomNavbar(),
      //     settings: settings,
      //   );
      case RoutePath.languageChangingPageRoute:
        return LanguageChangingPage.route();

      case RoutePath.mainRoute:
        return MainPage.route(settings: settings);
      case RoutePath.favoriteRoute:
        return FavoritesPage.route(settings: settings);
      case RoutePath.settingsRoute:
        return SettingsPage.route(settings: settings);

      case RoutePath.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );

      case RoutePath.registerRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );

      case RoutePath.verificationRoute:
        return MaterialPageRoute(
          builder: (_) => VerificationPage(),
          settings: settings,
        );

      case RoutePath.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
          settings: settings,
        );

      case RoutePath.cartRoute:
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
          settings: settings,
        );
      case RoutePath.notificationRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
          settings: settings,
        );

      case RoutePath.chooseLocation:
        return MaterialPageRoute(
          builder: (_) => ChooseLocationPage(),
          settings: settings,
        );
      case RoutePath.addNewCardRoute:
        final paymentCubit = settings.arguments as PaymentMethodsCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: paymentCubit,
            child: const AddNewCardPage(),
          ),
          settings: settings,
        );
      case RoutePath.productDetailsRoute:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: ProductDetailsPage(productId: productId),
          ),
          settings: settings,
        );
      case RoutePath.settingSecurityRoute:
        return MaterialPageRoute(
          builder: (_) => const SecurityPage(),
          settings: settings,
        );

      case RoutePath.settingNotificationsRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingNotificationPage(),
          settings: settings,
        );

      case RoutePath.settingLegalAndPoliciesRoute:
        return MaterialPageRoute(
          builder: (_) => const LegalAndPoliciesPage(),
          settings: settings,
        );

      case RoutePath.settingHelpRoute:
        return MaterialPageRoute(
          builder: (_) => const HelpAndSupportPage(),
          settings: settings,
        );

      case RoutePath.settingEditProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingEditProfilePage(),
          settings: settings,
        );

      case RoutePath.settingChangePasswordRoute:
        return MaterialPageRoute(
          builder: (_) => SettingChangePasswordPage(
            onDispose: () {},
          ),
          settings: settings,
        );

      case RoutePath.languageRoute:
        return LanguagePage.route(settings: settings);

      case RoutePath.trackingRoute:
        return MaterialPageRoute(
          builder: (_) => const OrderTrackingPage(),
          settings: settings,
        );

      default:
        return RouteErrorPage.routeError();
    }
  }
}

// Route<dynamic> _routeArgsHandler<T>(
//   Route<dynamic> Function({required T params, RouteSettings? settings})
//   routeCaller,
//   Object? args,
//   RouteSettings? settings,
// ) {
//   if (args is T) {
//     return routeCaller(params: args, settings: settings);
//   } else {
//     return RouteErrorPage.routeArgumentsError();
//   }
// }
