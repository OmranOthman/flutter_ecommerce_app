import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReviewPage extends StatefulWidget {
  final int orderId;
  final OrderCubit orderCubit;

  const AddReviewPage({
    required this.orderId,
    required this.orderCubit,
    super.key,
  });

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final TextEditingController _reviewController = TextEditingController();
  double _currentRating = 3;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('add_review'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'your_overall_rating_of_this_product'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: RatingBar.builder(
                initialRating: _currentRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 40.w,
                itemPadding: EdgeInsets.symmetric(horizontal: 8.w),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _currentRating = rating;
                  });
                },
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'add_your_review'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'write_your_review_here'.tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                ),
                contentPadding: EdgeInsets.all(16.w),
              ),
            ),
            SizedBox(height: 32.h),
            _isSubmitting
                ? Center(child: CircularProgressIndicator())
                : CustomButton(
              height: 50.h,
              onTap: () async {
                final rating = _currentRating.toInt();
                final reviewText = _reviewController.text.trim();

                if (rating == 0 || reviewText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('please_provide_rating_and_review'.tr),
                    ),
                  );
                  return;
                }

                setState(() {
                  _isSubmitting = true;
                });

                try {
                  await orderCubit.submitOrderReview(
                    orderId: widget.orderId,
                    rating: rating,
                    review: reviewText,
                  );

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('review_submitted_successfully'.tr),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('failed_to_submit_review'.tr),
                    ),
                  );
                } finally {
                  setState(() {
                    _isSubmitting = false;
                  });
                }
              },
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: AppColors.white,
              text: 'submit_review'.tr,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}