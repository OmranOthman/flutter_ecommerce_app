import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/image_place_holder_widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  final String errorMessage;
  const ErrorMessageWidget(
      {required this.errorMessage, this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagePlaceHolderWidget(
            imagePath: AppAssets.images.error,
            msg: errorMessage,
          ),
          onRetry != null
              ? IconButton.outlined(
                  color: AppColors.eucalyptusColor,
                  onPressed: onRetry,
                  icon: Icon(
                    Icons.refresh,
                    color: AppColors.eucalyptusColor,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
