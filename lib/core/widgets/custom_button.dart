import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';


class CustomButton extends StatelessWidget {
  final double height;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color foregroundColor;
  final String? text;
  final bool isLoading;

  CustomButton({
    super.key,
    this.height = 60,
    this.onTap,
    this.backgroundColor,
    this.foregroundColor = AppColors.white,
    this.text,
    this.isLoading = false,
  }) {
    assert(text != null || isLoading == true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: foregroundColor,
        ),
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
            : Text(
          text!,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}