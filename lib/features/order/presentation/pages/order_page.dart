import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  Widget _emptyOrderScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 60.r, color: AppColors.grey),
          SizedBox(height: 16.h),
          Text(
            'no_orders_yet'.tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'orders_appear_after_purchase'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _emptyHistoryScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_outlined, size: 60.r, color: AppColors.grey),
          SizedBox(height: 16.h),
          Text(
            'no_history_yet'.tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'past_orders_info'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasOrders = false;
    bool hasHistory = false;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "my_order".tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 22.sp),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.cartRoute);
              },
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 28.sp,
              ),
            )
          ],
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppColors.grey,
            labelColor: AppColors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0.w,
                color: Theme.of(context).primaryColor,
              ),
              insets: EdgeInsets.symmetric(horizontal: -30.w),
            ),
            tabs: [
              Tab(
                child: Text(
                  'my_order'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 16.sp),
                ),
              ),
              Tab(
                child: Text(
                  'history'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            hasOrders
                ? Center(
                    child: Text(
                      "My Order Content",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 18.sp),
                    ),
                  )
                : _emptyOrderScreen(context),
            hasHistory
                ? Center(
                    child: Text(
                      "History Content",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 18.sp),
                    ),
                  )
                : _emptyHistoryScreen(context),
          ],
        ),
      ),
    );
  }
}
