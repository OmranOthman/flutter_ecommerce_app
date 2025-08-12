import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double? width;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color foregroundColor;
  final String? text;
  final bool isLoading;
  final bool isOutlined;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;

  const CustomButton({
    super.key,
    this.height = 60,
    this.width,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor = AppColors.white,
    this.text,
    this.isLoading = false,
    this.isOutlined = false,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.icon,
  }) : assert(text != null || isLoading == true);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(height / 2);

    final buttonStyle = isOutlined
        ? OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding ?? EdgeInsets.zero,
      side: BorderSide(
        color: borderColor ?? Theme.of(context).primaryColor,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ,
      ),
    )
        : ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      foregroundColor: foregroundColor,
      padding: padding ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ,
      ),
      elevation: 0,
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: isOutlined
          ? OutlinedButton(
        onPressed: onTap,
        style: buttonStyle,
        child: _buildChild(context),
      )
          : ElevatedButton(
        onPressed: onTap,
        style: buttonStyle,
        child: _buildChild(context),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.white,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(width: 8),
          Text(
            text!,
            style: textStyle ??
                Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );
    }

    return Text(
      text!,
      style: textStyle ??
          Theme.of(context).textTheme.labelLarge?.copyWith(
            color: foregroundColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
