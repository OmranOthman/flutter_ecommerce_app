import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_model/product_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/view_model/vendor_cubit/vendor_cubit.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/widget/vendor_info_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class VendorPage extends StatelessWidget {
  static Route<dynamic> route({
    required int params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => VendorPage(
          vendorId: params,
        ),
      );
  final int vendorId;

  const VendorPage({
    super.key,
    required this.vendorId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<VendorCubit>()..loadVendorData(vendorId),
      child: VendorView(vendorId: vendorId),
    );
  }
}

class VendorView extends StatelessWidget {
  final int vendorId;

  const VendorView({required this.vendorId, super.key});

  @override
  Widget build(BuildContext context) {
    VendorCubit vendorCubit = BlocProvider.of<VendorCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: CustomTextFormField(
          hintText: 'search'.tr,
          readOnly: true,
          suffixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.of(context).pushNamed(
              RoutePath.searchRoute,
              arguments: vendorId,
            );
          },
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<VendorCubit, VendorState>(
          listener: (context, state) {
            if (state.favoriteErrorMessage != null) {
              showSnackBar(context, msg: state.favoriteErrorMessage!);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return ErrorMessageWidget(
                errorMessage: state.errorMessage!,
                onRetry: () => vendorCubit.loadVendorData(vendorId),
              );
            }

            if (state.vendorDetails == null) {
              return Center(child: Text('no_data_available'.tr));
            }

            final vendor = state.vendorDetails!;
            final categories = vendor.categories!.map((c) => c.title).toList();

            if (categories.isEmpty) {
              return EmptyWidget(
                icon: Icons.category_outlined,
                message: 'no_categories_found'.tr,
              );
            }

            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    // Vendor Header
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40.r,
                              backgroundImage: NetworkImage(vendor.brandImage!),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vendor.name!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '${'Products'.tr} ${vendor.categories!.fold<int>(0, (sum, c) => sum + c.products!.length)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            state.favoriteIsLoading
                                ? CircularProgressIndicator(
                                    constraints: BoxConstraints(
                                        minHeight: 20.h, minWidth: 20.w),
                                  )
                                : _iconBox(
                                    icon: vendor.isFavorite!
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: vendor.isFavorite!
                                        ? Colors.red
                                        : Theme.of(context).primaryColor,
                                    onTap: () {
                                      vendorCubit.toggleFavoriteVender(
                                          vendorId: vendorId);
                                    },
                                  ),
                            SizedBox(width: 4.w),
                            _iconBox(
                              icon: Icons.info_outline,
                              color: Theme.of(context).primaryColor,
                              onTap: () {
                                CustomBottomSheet.show(
                                  title: 'vendor_information'.tr,
                                  child: VendorInfoSheet(vendor: vendor),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _CategoryChipsHeader(
                        categories: state.vendorDetails!.categories!,
                        selectedCategory: state.selectedCategory,
                        onCategorySelected: (category) {
                          vendorCubit.selectedCategory(category);
                        },
                      ),
                    ),

                    if (state.selectedCategory!.products!.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: EmptyWidget(
                            icon: Icons.shopping_bag_outlined,
                            message: 'no_products_found'.tr,
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.w, vertical: 18.h),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final product =
                                  state.selectedCategory!.products![index];
                              final category = vendor.categories!.firstWhere(
                                (c) => c.id == product.categoryId,
                              );
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutePath.productDetailsRoute,
                                    arguments: product.id,
                                  );
                                },
                                child: _ProductItem(
                                  product: product,
                                  category: category.title!,
                                  vendorName: vendor.name!,
                                  toggleFavorite: () {
                                    vendorCubit.toggleFavoriteProduct(
                                        productId: product.id!,
                                        categoryId: category.id!);
                                  },
                                ),
                              );
                            },
                            childCount:
                                state.selectedCategory!.products!.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.7,
                          ),
                        ),
                      ),
                  ],
                ),
                if(state.favoriteProductIsLoading)
                Container(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _iconBox({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.alabasterColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 20.sp),
        onPressed: onTap,
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final ProductModel product;
  final String category;
  final String vendorName;
  final void Function() toggleFavorite;

  const _ProductItem({
    required this.product,
    required this.category,
    required this.vendorName,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: CachedNetworkImage(
                  imageUrl: product.media!,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: InkWell(
                    onTap: toggleFavorite,
                    child: Icon(
                      product.isFavorite!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 20.r,
                      color: product.isFavorite! ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Center(
          child: Text(
            product.name!,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            category,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Column(
          children: [
            if (product.priceBeforeDiscount != null)
              Text(
                '${product.priceBeforeDiscount?.toStringAsFixed(2)} ${'OMR'.tr}',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            Center(
              child: Text(
                '${product.price!.toStringAsFixed(2)} ${'OMR'.tr}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: product.priceBeforeDiscount != null
                          ? Colors.red
                          : Colors.black,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryChipsHeader extends SliverPersistentHeaderDelegate {
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final Function(CategoryModel category) onCategorySelected;

  _CategoryChipsHeader({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SizedBox(
        height: 45.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final category = categories[index];
            return ChoiceChip(
              showCheckmark: false,
              label: SizedBox(
                width: 68.w,
                height: 20.h,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    category.title!,
                    style: TextStyle(
                      color: selectedCategory == category
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
              selected: selectedCategory == category,
              onSelected: (_) => onCategorySelected(category),
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.transparent,
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.h;

  @override
  double get minExtent => 60.h;

  @override
  bool shouldRebuild(covariant _CategoryChipsHeader oldDelegate) =>
      oldDelegate.selectedCategory != selectedCategory ||
      oldDelegate.categories != categories;
}
