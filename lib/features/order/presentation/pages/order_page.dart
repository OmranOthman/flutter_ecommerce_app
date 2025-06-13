import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/widget/my_order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  final List<Map<String, dynamic>> currentOrders = const [
    {
      'productName': "Bix Bag Limited Edition 229",
      'color': "Brown",
      'quantity': 1,
      'status': "On Progress",
      'price': 24.00,
      'imageUrl':
          'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
      'isCompleted': false,
    },
    {
      'productName': "Bix Bag 319",
      'color': "Brown",
      'quantity': 1,
      'status': "On Progress",
      'price': 21.50,
      'imageUrl':
          'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
      'isCompleted': false,
    },
  ];

  final List<Map<String, dynamic>> pastOrders = const [
    {
      'productName': "Box Headphone 132",
      'color': "Black",
      'quantity': 1,
      'status': "Completed",
      'price': 26.00,
      'imageUrl':
          'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
      'isCompleted': true,
    },
    {
      'productName': "Box Headphone 345",
      'color': "Pink",
      'quantity': 1,
      'status': "Completed",
      'price': 27.30,
      'imageUrl':
          'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
      'isCompleted': true,
    },
  ];

  Widget _buildOrderList(List<Map<String, dynamic>> orders) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final order = orders[index];
        return MyOrderItem(
          productName: order['productName'],
          color: order['color'],
          quantity: order['quantity'],
          status: order['status'],
          price: order['price'],
          imageUrl: order['imageUrl'],
          isCompleted: order['isCompleted'],
        );
      },
    );
  }

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
              onPressed: () =>
                  Navigator.pushNamed(context, RoutePath.cartRoute),
              icon: Icon(Icons.shopping_bag_outlined, size: 28.sp),
            )
          ],
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppColors.grey,
            labelColor: AppColors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  width: 3.0.w, color: Theme.of(context).primaryColor),
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
            currentOrders.isEmpty
                ? _emptyOrderScreen(context)
                : _buildOrderList(currentOrders),
            pastOrders.isEmpty
                ? _emptyHistoryScreen(context)
                : _buildOrderList(pastOrders),
          ],
        ),
      ),
    );
  }
}
