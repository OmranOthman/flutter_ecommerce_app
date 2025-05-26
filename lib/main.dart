import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/presentation/app.dart';
import 'package:flutter_ecommerce_app/core/util/bloc_observable.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObservable();
  await init();
  runApp(const App());
}

