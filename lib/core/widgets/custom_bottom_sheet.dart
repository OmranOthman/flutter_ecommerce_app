import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/app_router.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  static Future<T?> show<T>({
    required Widget child,
    BuildContext? context,
    String? title,
    bool isDismissible = true,
  }) =>
      showModalBottomSheet<T>(
        context: context ?? AppRouter.navigatorKey.currentContext!,
        enableDrag: isDismissible,
        constraints: BoxConstraints(
          maxHeight:
              MediaQuery.of(context ?? AppRouter.navigatorKey.currentContext!)
                      .size
                      .height *
                  0.85,
        ),
        isDismissible: isDismissible,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (_) => CustomBottomSheet(
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Divider(
              height: 40,
              thickness: 2,
            ),
          ),
          const SizedBox(height: 16.0),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
