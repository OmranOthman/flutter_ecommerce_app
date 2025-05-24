import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/models/payment_card_model.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentCardModel paymentCard;
  final VoidCallback onItemTapped;
  const PaymentMethodItem({
    super.key,
    required this.paymentCard,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTapped,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), // ScreenUtil radius
          color: AppColors.white,
          border: Border.all(color: AppColors.grey3),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          leading: CachedNetworkImage(
            imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/1200px-MasterCard_Logo.svg.png',
            width: 50.w,
            height: 50.h,
            fit: BoxFit.contain,
          ),
          title: Text(
            'MasterCard',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            paymentCard.cardNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Icon(Icons.chevron_right, size: 24.w),
        ),
      ),
    );
  }
}
