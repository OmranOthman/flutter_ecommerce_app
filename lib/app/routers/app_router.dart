import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/widgets/change_language.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/pages/address_info_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/rest_password_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/verification_page.dart';
import 'package:flutter_ecommerce_app/features/bio_metriecs/pages/bio_metric_page.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/pages/notifications_page.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/pages/main_page.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_details_page.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_tracking_page.dart';
import 'package:flutter_ecommerce_app/features/search/presentation/pages/search_page.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/pages/address_user_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/change_password_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/help_and_support_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/language_page.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/pages/checkout_page.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/pages/addresses_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/legal_and_policies_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/notification_settings_page.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/collection_page.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/review_page.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/security_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/vendor_page.dart';

import 'route_error_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Getting agrs passed in while calling Navigastor.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePath.splashRoute:
        return SplashPage.route(settings: settings);

      case RoutePath.onBoardingRoute:
        return OnboardingPage.route(settings: settings);

      case RoutePath.biometricRoute:
        return MaterialPageRoute(
          builder: (_) => const BioMetricPage(),
          settings: settings,
        );

      case RoutePath.languageChangingPageRoute:
        return LanguageChangingPage.route();

      case RoutePath.mainRoute:
        return MainPage.route(settings: settings);
      case RoutePath.favoriteRoute:
        return FavoritesPage.route(settings: settings);
      case RoutePath.settingsRoute:
        return SettingsPage.route(settings: settings);

      case RoutePath.loginRoute:
        return LoginPage.route(settings: settings);

      case RoutePath.registerRoute:
        return RegisterPage.route(settings: settings);

      case RoutePath.verificationRoute:
        return _routeArgsHandler<VerificationParams>(
            VerificationPage.route, args, settings);

      case RoutePath.forgetPasswordRoute:
        return _routeArgsHandler<RestPasswordParams>(
            RestPasswordPage.route, args, settings);

      case RoutePath.cartRoute:
        return CartPage.route(settings: settings);

      case RoutePath.searchRoute:
        return _routeArgsHandler<int?>(SearchPage.route, args, settings);
      case RoutePath.addReviewPageRoute:
        return _routeArgsHandler<ReviewParams>(
            ReviewPage.route, args, settings);

      case RoutePath.addressesRoute:
        return _routeArgsHandler<CartCubit?>(
            AddressesPage.route, args, settings);

      case RoutePath.settingChangePasswordRoute:
        return ChangePasswordPage.route(settings: settings);

      case RoutePath.languageRoute:
        return LanguagePage.route(settings: settings);

      case RoutePath.addressInfoRoute:
        return _routeArgsHandler<AddressParams>(
            AddressInfoPage.route, args, settings);

      case RoutePath.addressUserRoute:
        return _routeArgsHandler<AddressParams>(
            AddressUserPage.route, args, settings);

      case RoutePath.productDetailsRoute:
        return _routeArgsHandler<int>(ProductDetailsPage.route, args, settings);

      case RoutePath.vendorDetailsRoute:
        return _routeArgsHandler<int>(VendorPage.route, args, settings);

      case RoutePath.checkoutRoute:
        return _routeArgsHandler<CheckoutParams>(
            CheckoutPage.route, args, settings);

      case RoutePath.orderDetailsRoute:
        return _routeArgsHandler<int>(OrderDetailsPage.route, args, settings);
      case RoutePath.collectionRoute:
        return _routeArgsHandler<int>(CollectionPage.route, args, settings);
      case RoutePath.notificationRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
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

Route<dynamic> _routeArgsHandler<T>(
  Route<dynamic> Function({required T params, RouteSettings? settings})
      routeCaller,
  Object? args,
  RouteSettings? settings,
) {
  if (args is T) {
    return routeCaller(params: args, settings: settings);
  } else {
    return RouteErrorPage.routeArgumentsError();
  }
}
