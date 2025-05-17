import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/presentation/app.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}

