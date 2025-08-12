import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingDialog {
  static Future<void> show({
    required BuildContext context,
    required ValueChanged<double> onRatingChanged,
    double initialRating = 2.5,
    String? title,
    bool allowHalfRating = true,
    int starCount = 5,
    Color color = Colors.amber,
    Color borderColor = Colors.grey,
    String confirmButtonText = "Confirm Review",
    Color? confirmButtonColor,
  }) async {
    double currentRating = initialRating;

    await CustomBottomSheet.show(
      context: context,
      title: title,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RatingBar.builder(
                  initialRating: initialRating,
                  minRating: 1,
                  maxRating: starCount.toDouble(),
                  direction: Axis.horizontal,
                  allowHalfRating: allowHalfRating,
                  itemCount: starCount,
                  itemSize: 40.r,
                  itemPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: color,
                  ),
                  unratedColor: borderColor,
                  onRatingUpdate: (rating) {
                    setState(() => currentRating = rating);
                  },
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  height: 50.h,
                  onTap: () {
                    Navigator.pop(context);
                    onRatingChanged(currentRating);
                  },
                  text: confirmButtonText,
                  backgroundColor: confirmButtonColor ?? Theme.of(context).primaryColor,
                  foregroundColor: AppColors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}