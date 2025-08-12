import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/add_review_page.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_lines_model/order_lines_model.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderDetailsPage extends StatelessWidget {
  static Route<dynamic> route({
    required int params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => OrderDetailsPage(
          orderId: params,
        ),
      );
  final int orderId;

  const OrderDetailsPage({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<OrderCubit>()..loadOrderDetails(orderId),
      child: OrderDetailsView(
        orderId: orderId,
      ),
    );
  }
}

class OrderDetailsView extends StatelessWidget {
  final int orderId;

  const OrderDetailsView({
    required this.orderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details'.tr,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha:0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.star_rate_rounded,
                size: 20.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: orderCubit,
                  child: AddReviewPage(
                    orderId: orderId,
                    orderCubit: orderCubit,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state.isLoadingOrderDetails) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessageOrderDetails != null) {
            return ErrorMessageWidget(
              onRetry: () {
                orderCubit.loadOrderDetails(orderId);
              },
              errorMessage: state.errorMessageOrderDetails!,
            );
          }
          return RefreshIndicator(
            onRefresh: () async => orderCubit.loadOrderDetails(orderId),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                spacing: 24.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatusHeader(context),
                  _buildVendorInfo(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "${'Order_no'.tr} $orderId",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  _buildOrderItems(context),
                  _buildOrderSummary(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusHeader(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);

    String? status = orderCubit.state.orderModel!.status;
    String? expectedPrepTime = orderCubit.state.orderModel!.expectedPrepTime;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: _getStatusColor(status!).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: _getStatusColor(status).withValues(alpha:0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getStatusIcon(status),
              color: _getStatusColor(status),
              size: 24.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'Status'.tr} ${status.tr}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(status),
                  ),
                ),
                if (expectedPrepTime != null)
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      '${'Estimated preparation time'.tr}: $expectedPrepTime',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVendorInfo(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);

    String? vendorName = orderCubit.state.orderModel!.vendorName;
    String? vendorImage = orderCubit.state.orderModel!.vendorBrandImage;
    int? orderId = orderCubit.state.orderModel!.id;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: ClipOval(
              child: vendorImage != null
                  ? Image.network(
                vendorImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.store,
                  size: 24.w,
                  color: Colors.grey.shade400,
                ),
              )
                  : Icon(
                Icons.store,
                size: 24.w,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendorName!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "${'Order_no'.tr} $orderId",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItems(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);

    List<OrderLinesModel>? orderLines = orderCubit.state.orderModel!.orderLines;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: orderLines!.length,
        itemBuilder: (context, index) {
          String? productName = orderLines[index].name;
          String? media = orderLines[index].media;
          int? quantity = orderLines[index].quantity;
          int? unitPrice = orderLines[index].unitPrice;
          int? total = orderLines[index].total;
          String? note = orderLines[index].note;

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    color: Colors.grey.shade100,
                    child: media != null
                        ? Image.network(
                      media,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 24.w,
                              color: Colors.grey.shade400,
                            ),
                          ),
                    )
                        : Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 24.w,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${'Quantity'.tr}: $quantity',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '${'Unit Price'.tr}: ${unitPrice!.toStringAsFixed(2)} ${'OMR'.tr}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      if (note != null) ...[
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.note_outlined,
                                size: 16.w,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  note,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  ' $total ${'OMR'.tr}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
    String? paymentMethod = orderCubit.state.orderModel!.paymentStatus;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status Method'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Colors.blue.shade100,
                  ),
                ),
                child: Text(
                  paymentMethod!.tr,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Icons.access_time;
      case 'completed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }
}