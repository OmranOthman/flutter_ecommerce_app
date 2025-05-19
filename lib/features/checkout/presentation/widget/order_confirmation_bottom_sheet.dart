import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/widgets/main_button.dart';

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
            const Text(
              'Order Successfully',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your order will be packed by the clerk, will arrive at your house in 3 to 4 days',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            MainButton(
              text: 'Order Tracking',
              onTap: () {
                Navigator.pushNamed(
                    context, AppRoutes.trackingRoute);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}