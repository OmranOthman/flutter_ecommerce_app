import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/product_details/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/views/widgets/counter_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
      current is ProductDetailsLoading ||
          current is ProductDetailsLoaded ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        } else if (state is ProductDetailsLoaded) {
          return ProductDetailsView(product: state.product);
        } else {
          return const Scaffold(
            body: Center(child: Text('Something went wrong!')),
          );
        }
      },
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  final ProductItemModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePath.cartRoute);
            },
            icon: Icon(Icons.shopping_bag_outlined, size: 24.sp),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 520.h,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.grey2),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                CachedNetworkImage(
                  imageUrl: product.imgUrl,
                  height: 400.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 470.h),
            child: SingleChildScrollView(
              child: Container(
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
                      _buildTitleAndCounter(context, cubit),
                      SizedBox(height: 16.h),
                      _buildSizeSelector(context, cubit),
                      SizedBox(height: 16.h),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _buildDescription(product.description),
                      SizedBox(height: 16.h),
                      _buildBottomRow(context, cubit),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndCounter(
      BuildContext context, ProductDetailsCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.yellow, size: 22.sp),
                  SizedBox(width: 5.w),
                  Text(product.averageRate.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18.sp)),
                ],
              ),
            ],
          ),
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is QuantityCounterLoaded ||
              current is ProductDetailsLoaded,
          builder: (context, state) {
            if (state is QuantityCounterLoaded) {
              return CounterWidget(
                value: state.value,
                productId: product.id,
                cubit: cubit,
              );
            } else if (state is ProductDetailsLoaded) {
              return CounterWidget(
                value: 1,
                productId: product.id,
                cubit: cubit,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Widget _buildSizeSelector(BuildContext context, ProductDetailsCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is SizeSelected || current is ProductDetailsLoaded,
          builder: (context, state) {
            return Row(
              children: ProductSize.values
                  .map(
                    (size) => Padding(
                  padding: EdgeInsets.only(top: 6.h, right: 8.w),
                  child: InkWell(
                    onTap: () => cubit.selectSize(size),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state is SizeSelected && state.size == size
                            ? Theme.of(context).primaryColor
                            : AppColors.grey2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Text(
                          size.name,
                          style: TextStyle(
                            color: state is SizeSelected && state.size == size
                                ? AppColors.white
                                : AppColors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isExpanded
                  ? description
                  : description.length > 100
                  ? '${description.substring(0, 100)}...'
                  : description,
              style: TextStyle(color: AppColors.black45, fontSize: 14.sp),
            ),
            if (description.length > 100)
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Show Less' : 'Read More',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildBottomRow(BuildContext context, ProductDetailsCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is QuantityCounterLoaded ||
              current is ProductDetailsLoaded,
          builder: (context, state) {
            final total = cubit.totalPrice;
            return Text.rich(
              TextSpan(
                text: '\$ ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 24.sp,
                ),
                children: [
                  TextSpan(
                    text: total.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is ProductAddedToCart || current is ProductAddingToCart,
          builder: (context, state) {
            if (state is ProductAddingToCart) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: 18.h, horizontal: 40.w),
                ),
                child: const CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductAddedToCart) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: 18.h, horizontal: 40.w),
                ),
                child: Text(
                  'Added To Cart',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              );
            }
            return ElevatedButton.icon(
              onPressed: () {
                if (cubit.selectedSize != null) {
                  cubit.addToCart(product.id);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select size'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: AppColors.white,
                padding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 40.w),
              ),
              label: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 22.sp,
              ),
            );
          },
        ),
      ],
    );
  }
}
