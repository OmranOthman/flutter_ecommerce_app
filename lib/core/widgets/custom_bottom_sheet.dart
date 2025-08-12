import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/app_router.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 160.w, vertical: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.h),
              child: Divider(
                height: 6,
                thickness: 6,
                color: AppColors.greyLightColor,
              ),
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
