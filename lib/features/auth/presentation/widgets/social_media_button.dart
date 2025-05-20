import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  final String? text;
  final String? img;
  final VoidCallback? onTap;
  final bool isLoading;

  SocialMediaButton({
    super.key,
    this.text,
    this.img,
    this.onTap,
    this.isLoading = false,
  }) {
    assert((text != null && img != null) || isLoading == true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      img!,
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      text!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
