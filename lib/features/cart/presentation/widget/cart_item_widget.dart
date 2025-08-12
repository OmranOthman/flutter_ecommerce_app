import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_line_model.dart/cart_lines_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/widget/counter_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartItemWidget extends StatelessWidget {
  final CartLinesModel cartItem;
  final void Function()? increase;
  final void Function()? deleteCartItem;
  final void Function()? decrease;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.deleteCartItem,
    required this.decrease,
    required this.increase,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w),
        CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Image(image: imageProvider),
          imageUrl: cartItem.media!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.greyColor.withValues(alpha: 0.5),
            highlightColor: AppColors.greyLightColor,
            child: Container(
              width: 75.w,
              height: 75.h,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      cartItem.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      ConfirmDialog.show(
                        context,
                        title: "remove".tr,
                        confirmMessage: "are_you_sure_delete_item".tr,
                        onConfirm: deleteCartItem!,
                      );
                    },
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: AppColors.redColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        size: 20.w,
                        color: AppColors.redColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                spacing: 5,
                children: [
                  Text(
                    "${"quantity".tr} : ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CounterWidget(
                    increase: increase,
                    decrease: decrease,
                    value: cartItem.quantity!,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                "${(cartItem.pricePerProduct! * cartItem.quantity!).toStringAsFixed(2)} ${'OMR'.tr}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
