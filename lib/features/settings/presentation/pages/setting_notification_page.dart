import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/toggle_item.dart';

class SettingNotificationPage extends StatelessWidget {
  const SettingNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notifications".tr,
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 20.sp),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              ToggleItem(title: "payment_notifications".tr, isLast: false),
              ToggleItem(title: "tracking_notifications".tr, isLast: false),
              ToggleItem(title: "complete_order_notifications".tr, isLast: false),
              ToggleItem(title: "notification_notifications".tr, isLast: true),
            ],
          ),
        ),
      ),
    );
  }
}