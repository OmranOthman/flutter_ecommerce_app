import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final double? height;
  final double? radius;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      elevation: 0,
      height: height ?? size.height * 0.060,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 24),
      ),
      onPressed: onPressed,
      child: Text(textButton, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
