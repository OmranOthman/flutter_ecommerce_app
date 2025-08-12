import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/toggle_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingNotificationPage extends StatelessWidget {
  const SettingNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notifications".tr,
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ToggleItem(
                title: "payment_notifications".tr,
                isLast: false,
                value: false,
                onChanged: (val) {},
              ),
              ToggleItem(
                title: "tracking_notifications".tr,
                isLast: false,
                value: false,
                onChanged: (val) {},
              ),
              ToggleItem(
                title: "complete_order_notifications".tr,
                isLast: false,
                value: false,
                onChanged: (val) {},
              ),
              ToggleItem(
                title: "notification_notifications".tr,
                isLast: false,
                value: false,
                onChanged: (val) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
