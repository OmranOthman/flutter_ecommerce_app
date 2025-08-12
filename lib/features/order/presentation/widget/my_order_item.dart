import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MyOrderItem extends StatelessWidget {
  final OrderModel orderModel;

  MyOrderItem({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      symbol: '${'OMR'.tr} ',
      decimalDigits: 2,
      locale: AppLocalizations.of(context)!.locale.languageCode,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withValues(alpha:0.2),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: orderModel.vendorBrandImage!,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              orderModel.vendorName ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: getOrderStateBackground(),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  getOrderStatusTranslated(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: getOrderStateTextColor(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                currencyFormat.format(orderModel.total ?? 0),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (orderModel.createdAt != null)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            formatDate(orderModel.createdAt!, context),
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
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 40.h,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePath.orderDetailsRoute,
                        arguments: orderModel.id!,
                      );
                    },
                    isOutlined: true,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Theme.of(context).primaryColor,
                    text: 'details'.tr,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String dateString, BuildContext context) {
    try {
      final date = DateTime.parse(dateString);
      final locale = AppLocalizations.of(context)!.locale.languageCode;
      return DateFormat.yMMMd(locale).format(date); // Ex: "Jun 28, 2025" or "٢٨‏/٦‏/٢٠٢٥"
    } catch (e) {
      return dateString;
    }
  }

  Color getOrderStateTextColor() {
    switch (orderModel.status?.toLowerCase()) {
      case 'pending':
        return Colors.orange[800]!;
      case 'completed':
        return Colors.green[800]!;
      case 'cancelled':
        return Colors.red[800]!;
      default:
        return Colors.grey[800]!;
    }
  }

  Color getOrderStateBackground() {
    switch (orderModel.status?.toLowerCase()) {
      case 'pending':
        return Colors.orange[100]!;
      case 'completed':
        return Colors.green[100]!;
      case 'cancelled':
        return Colors.red[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  String getOrderStatusTranslated() {
    switch (orderModel.status?.toLowerCase()) {
      case 'pending':
        return 'pending'.tr;
      case 'completed':
        return 'completed'.tr;
      case 'cancelled':
        return 'cancelled'.tr;
      default:
        return orderModel.status ?? 'unknown';
    }
  }
}
