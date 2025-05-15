import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/presentation/app_bloc/app_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/app_router.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/theme/app_theme.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (context) => di<AppBloc>(), child: const AppView());
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '',
              initialRoute:  AppRoutes.loginRoute,
                onGenerateRoute: AppRouter.onGenerateRoute,
            navigatorKey: AppRouter.navigatorKey,
           // themeMode: ThemeMode.light,
            themeMode: state.themeMode,
            theme: AppTheme.theme[AppThemeData.lightTheme],
             darkTheme: AppTheme.theme[AppThemeData.darkTheme],
             locale: state.locale,
            //locale: Locale('ar'),
            supportedLocales: const [
              Locale('en', 'US'),
             // Locale('ar'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
