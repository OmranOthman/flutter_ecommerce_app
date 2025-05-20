import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class OrderConfirmationBottomSheet {
  static void show({
    required BuildContext context,
    VoidCallback? onTrackOrder,
    VoidCallback? onBackToHome,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 150),
            const SizedBox(height: 20),
            Text(
              'Order Successfully',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your order will be packed by the clerk, will arrive at your house in 3 to 4 days',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Order Tracking',
              onTap: () {
                Navigator.pushNamed(context, RoutePath.trackingRoute);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}