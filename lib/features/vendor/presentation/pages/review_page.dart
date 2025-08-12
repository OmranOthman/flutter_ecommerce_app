import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/datasource/vendor_remote_data_source.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/view_model/review_cubit/review_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ReviewPage extends StatelessWidget {
  static Route<dynamic> route({
    required ReviewParams params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => ReviewPage(
          productId: params.productId,
          productName: params.productName,
          productImage: params.productImage,
        ),
      );

  final int productId;
  final String productName;
  final String productImage;

  const ReviewPage({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<ReviewCubit>()..loadProductReviews(productId),
      child: ReviewView(
        productId: productId,
        productImage: productImage,
        productName: productName,
      ),
    );
  }
}

class ReviewView extends StatefulWidget {
  final int productId;
  final String productName;
  final String productImage;

  const ReviewView({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImage,
  });

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  double _currentRating = 0;
  final TextEditingController _reviewController = TextEditingController();
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _reviewController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _showTopMessage(String message, {bool isError = true}) {
    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20.w,
        right: 20.w,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isError ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isError ? Icons.error_outline : Icons.check_circle,
                  color: Colors.white,
                  size: 20.w,
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'your_overall_rating_of_this_product'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: RatingBar.builder(
                  initialRating: _currentRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
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
              SizedBox(height: 24.h),
              Text(
                'add_your_review'.tr,
                style: TextStyle(
                  fontSize: 16,
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
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                height: 50.h,
                onTap: () async {
                  final rating = _currentRating.toInt();
                  final reviewText = _reviewController.text.trim();
                  if (rating == 0 || reviewText.isEmpty) {
                    _showTopMessage('please_provide_rating_and_review'.tr);
                    return;
                  }
                  try {
                    await di<VendorRemoteDataSource>().addProductReview(
                      productId: widget.productId,
                      rating: rating,
                      review: reviewText,
                    );

                    context.read<ReviewCubit>().loadProductReviews(widget.productId);

                    setState(() {
                      _currentRating = 0;
                      _reviewController.clear();
                    });

                    Navigator.pop(context);
                    _showTopMessage(
                      'review_submitted_successfully'.tr,
                      isError: false,
                    );
                  } catch (e) {
                    Navigator.pop(context);
                    _showTopMessage('failed_to_submit_review'.tr);
                  }
                },
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: AppColors.white,
                text: 'submit_review'.tr,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    ReviewCubit cubit = BlocProvider.of<ReviewCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('reviews'.tr),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.productImage.isNotEmpty
                        ? widget.productImage
                        : 'https://via.placeholder.com/80',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        color: Colors.grey[200],
                      ),
                      child: const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.productName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () => _showReviewBottomSheet(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha:0.1),
                                  borderRadius: BorderRadius.circular(16.w),
                                ),
                                child: Text(
                                  'add_review'.tr,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ReviewCubit, ReviewState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.errorMessage != null) {
                    return ErrorMessageWidget(
                      errorMessage: state.errorMessage!,
                      onRetry: () {
                        cubit.loadProductReviews(widget.productId);
                      },
                    );
                  }
                  if (state.reviews.isEmpty) {
                    return EmptyWidget(
                      message: 'no_reviews_available'.tr,
                      icon: Icons.reviews_outlined,
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: state.reviews.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final review = state.reviews[index];

                      return Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha:0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width - 32.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Icon(Icons.person_outline, size: 20.sp, color: Colors.grey[700]),
                                        SizedBox(width: 8.w),
                                        Flexible(
                                          child: Text(
                                            review.customerName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[800],
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RatingBarIndicator(
                                        rating: review.rating.toDouble(),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 22.sp,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black12, width: 1),
                              ),
                              child: Text(
                                review.review,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                  height: 1.4,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              review.createdAt,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}