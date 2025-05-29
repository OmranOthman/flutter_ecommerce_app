import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notification".tr,  // Updated to match JSON key
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.settingNotificationsRoute);
            },
            icon: Icon(Icons.settings_outlined, size: 24.sp),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                "recent_notifications".tr,  // Updated to match JSON key
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24.sp),
              ),
            ),
            NotificationCard(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              title: "purchase_completed".tr,  // Updated to match JSON key
              message:
              "You have successfully purchased 334 headphones, thank you and wait for your package to arrive".tr,
              time: "9:30 AM".tr,
              hasAction: false,
            ),
            NotificationCard(
              icon: Icons.message,
              iconColor: Colors.blue,
              title: "message_received".tr,  // Updated to match JSON key (Note: You might want to handle the {sender} parameter)
              message: "hello your package has almost arrived, are you at home now?".tr,
              time: "9:25 AM",
              hasAction: true,
            ),
            NotificationCard(
              icon: Icons.local_offer,
              iconColor: Colors.orange,
              title: "flash_sale".tr,  // Updated to match JSON key
              message: "Get 20% discount for first transaction in this week".tr,
              time: "9:15 AM".tr,
              hasAction: false,
            ),
          ],
        ),
      ),
    );
  }
}