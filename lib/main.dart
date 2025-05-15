import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/presentation/app.dart';
import 'package:flutter_ecommerce_app/app/routers/app_router.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthCubit>(
//           create: (context) {
//             final cubit = AuthCubit();
//             cubit.checkAuth();
//             return cubit;
//           },
//         ),
    
      
//       ],
//       child: Builder(
//         builder: (context) {
//           final authCubit = BlocProvider.of<AuthCubit>(context);
//           return BlocBuilder<AuthCubit, AuthState>(
//             bloc: authCubit,
//             buildWhen: (previous, current) =>
//                 current is AuthDone || current is AuthInitial,
//             builder: (context, state) {
//               return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 title: 'E-commerce App',
//                 navigatorKey: navigatorKey,
//                 theme: ThemeData(
//                   colorScheme:
//                       ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//                   useMaterial3: true,
//                 ),
//                 // home: const ,
//                 initialRoute:  AppRoutes.loginRoute,
//                 onGenerateRoute: AppRouter.onGenerateRoute,
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
