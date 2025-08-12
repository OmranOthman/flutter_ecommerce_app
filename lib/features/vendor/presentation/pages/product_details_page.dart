import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/view_model/product_details_cubit/product_details_state.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/widget/add_cart_force_dialog.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/widget/counter_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsPage extends StatelessWidget {
  static Route<dynamic> route({
    required int params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => ProductDetailsPage(
          productId: params,
        ),
      );
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<ProductDetailsCubit>()..fetchProductDetails(productId),
      child: ProductDetailsView(
        productId: productId,
      ),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  final int productId;

  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit productDetailsCubit =
        BlocProvider.of<ProductDetailsCubit>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'product_details'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
        actions: [
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RoutePath.addReviewPageRoute,
                      arguments: ReviewParams(
                        productId: state.product!.id!,
                        productName: state.product!.name!,
                        productImage: state.product!.media!.isNotEmpty
                            ? state.product!.media![0]
                            : '',
                      ),
                    );
                  },
                  icon: Icon(Icons.rate_review_outlined));
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.cartRoute);
              },
              icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if (state.addToCartErrorMessage != null) {
            if (state.addToCartErrorMessage ==
                    "You cannot add items from different vendor to the same cart." ||
                state.addToCartErrorMessage ==
                    "لا تستطيع إضافة عناصر من مطعم مختلف إلى السلة نفسها") {
              AddCartForceDialog.show(context,
                  confirmMessage: state.addToCartErrorMessage!,
                  title: "note".tr, onConfirm: () {
                productDetailsCubit.addForceCart();
              });
            } else {
              showSnackBar(context, msg: state.addToCartErrorMessage!);
            }
          }

          if (state.favoriteErrorMessage != null) {
            showSnackBar(context, msg: state.favoriteErrorMessage!);
          }
          if (state.addToCartSuccess) {
            showSnackBar(context,
                msg: "product_added_cart".tr,
                backgroundColor: AppColors.greanColor);
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessage != null) {
            return ErrorMessageWidget(
              errorMessage: state.errorMessage!,
              onRetry: () {
                productDetailsCubit.fetchProductDetails(productId);
              },
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 520.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppColors.grey2),
                        child: Column(
                          children: [
                            SizedBox(height: 100.h),
                            CachedNetworkImage(
                              imageUrl: state.product!.media!.isNotEmpty
                                  ? state.product!.media![0]
                                  : '',
                              height: 400.h,
                              fit: BoxFit.contain,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  height: 400.h,
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                  Icons.broken_image,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, right: 15),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: productDetailsCubit.state.favoriteIsLoading
                              ? CircularProgressIndicator(
                                  constraints: BoxConstraints(
                                      minHeight: 20.h, minWidth: 20.w),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.alabasterColor,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                        productDetailsCubit
                                                .state.product!.isFavorite!
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: productDetailsCubit
                                                .state.product!.isFavorite!
                                            ? Colors.red
                                            : Theme.of(context).primaryColor,
                                        size: 20.sp),
                                    onPressed: () {
                                      productDetailsCubit
                                          .toggleFavoriteProduct();
                                    },
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(36.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitleAndCounter(context),
                              SizedBox(height: 16.h),
                              _buildDescription(state.product!.description!),
                              SizedBox(height: 100.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomRow(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitleAndCounter(BuildContext context) {
    ProductDetailsCubit productDetailsCubit =
        BlocProvider.of<ProductDetailsCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productDetailsCubit.state.product!.name!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.yellow, size: 22.sp),
                  SizedBox(width: 5.w),
                  Text(
                    '4.5',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        CounterWidget(
          decrease: () => productDetailsCubit.decreaseQuantity(),
          increase: () => productDetailsCubit.increaseQuantity(),
          value: productDetailsCubit.state.quantity,
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description.isNotEmpty ? description : 'no_description_available'.tr,
      style: TextStyle(color: AppColors.black45, fontSize: 14.sp),
    );
  }

  Widget _buildBottomRow(
    BuildContext context,
  ) {
    ProductDetailsCubit productDetailsCubit =
        BlocProvider.of<ProductDetailsCubit>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "${productDetailsCubit.state.totalPrice}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                children: [
                  TextSpan(
                    text: "OMR".tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                        ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            isLoading: productDetailsCubit.state.addToCartIsLoading,
            height: 50.h,
            width: 160.w,
            text: 'add_to_cart'.tr,
            icon: Icon(Icons.shopping_bag_outlined,
                color: Colors.white, size: 22.sp),
            onTap: () {
              productDetailsCubit.addToCart();
              //   showSnackBar(context,
              // msg: "product_added_cart".tr, backgroundColor: AppColors.greenColor);
            },
          ),
        ],
      ),
    );
  }
}
