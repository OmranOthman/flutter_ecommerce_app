import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/add_new_card_cubit/payment_methods_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/add_new_card_page.dart';
import 'package:flutter_ecommerce_app/views/pages/checkout_page.dart';
import 'package:flutter_ecommerce_app/views/pages/choose_location_page.dart';
import 'package:flutter_ecommerce_app/views/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce_app/views/pages/login_page.dart';
import 'package:flutter_ecommerce_app/views/pages/notifications_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/views/pages/register_page.dart';
import 'package:flutter_ecommerce_app/views/pages/security_page.dart';
import 'package:flutter_ecommerce_app/views/pages/settings_page.dart';
import 'package:flutter_ecommerce_app/views/widgets/bottom/custom_bottom_navbar.dart';
// import 'package:flutter_ecommerce_app/app/routers/route_info.dart';


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
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );

      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );

      case AppRoutes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );

      case AppRoutes.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
          settings: settings,
        );
      case AppRoutes.chooseLocation:
        return MaterialPageRoute(
          builder: (_) => ChooseLocationPage(),
          settings: settings,
        );
      case AppRoutes.addNewCardRoute:
      final paymentCubit = settings.arguments as PaymentMethodsCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: paymentCubit,
            child: const AddNewCardPage(),
          ),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
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
      case AppRoutes.securityRoute:
        return MaterialPageRoute(
          builder: (_) => const SecurityPage(),
          settings: settings,
        );

      case AppRoutes.notificationsRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
          settings: settings,
        );
        case AppRoutes.settingsRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: settings,
        );
        case AppRoutes.editProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
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
