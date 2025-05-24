import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class OrderConfirmationBottomSheet {
  static void show({
    required BuildContext context,
    VoidCallback? onTrackOrder,
    VoidCallback? onBackToHome,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 150.w,
              ),
              SizedBox(height: 20.h),
              Text(
                'order_successfully'.tr,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'order_confirmation_message'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'order_tracking'.tr,
                  onTap: onTrackOrder ??
                          () {
                        Navigator.pushNamed(context, RoutePath.trackingRoute);
                      },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}