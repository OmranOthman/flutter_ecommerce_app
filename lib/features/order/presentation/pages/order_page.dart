import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/widget/my_order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OrderCubit>()
        ..loadOnGoingOrders()
        ..loadCompletedOrders(),
      child: OrderView(),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

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
                ?.copyWith(fontSize: 22),
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
                      ?.copyWith(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  'history'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOnGoingOrdersList(context),
            _buildCompletedOrdersList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOnGoingOrdersList(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
    return BlocBuilder<OrderCubit, OrderState>(
      bloc: orderCubit,
      builder: (context, state) {
        if (state.isLoadingOnGoingOrders) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.errorMessageOnGoingOrders != null) {
          return ErrorMessageWidget(
            errorMessage: state.errorMessageOnGoingOrders!,
            onRetry: () {
              orderCubit.loadOnGoingOrders();
            },
          );
        }
        if (state.onGoingOrders!.isEmpty) {
          return EmptyWidget(
            message: 'no_orders'.tr,
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            orderCubit.loadOnGoingOrders();
          },
          child: ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: state.onGoingOrders!.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              OrderModel order = state.onGoingOrders![index];
              return MyOrderItem(
                orderModel: order,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCompletedOrdersList(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
    return BlocBuilder<OrderCubit, OrderState>(
      bloc: orderCubit,
      builder: (context, state) {
        if (state.isLoadingCompletedOrders) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.errorMessageCompletedOrders != null) {
          return ErrorMessageWidget(
            errorMessage: state.errorMessageCompletedOrders!,
            onRetry: () {
              orderCubit.loadOnGoingOrders();
            },
          );
        }
        if (state.completedOrders!.isEmpty) {
          return EmptyWidget(
            message: 'no_orders_yet'.tr,
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            orderCubit.loadOnGoingOrders();
          },
          child: ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: state.completedOrders!.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              OrderModel order = state.completedOrders![index];
              return MyOrderItem(
                orderModel: order,
              );
            },
          ),
        );
      },
    );
  }
}
