import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constans/app_distances.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String text;
  final bool isLoading;
  final double height;

  const CustomButton({
    super.key,
    this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.height=60,
    required this.text,

    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? null : onPressed,
      color:backgroundColor ,
      height: height,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDistances.borderRadius)),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
    );
  }
}
