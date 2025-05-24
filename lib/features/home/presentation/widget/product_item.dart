import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;

  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 170.h,
              width: 154.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: CachedNetworkImage(
                  imageUrl: productItem.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    bloc: homeCubit,
                    buildWhen: (previous, current) =>
                    (current is SetFavoriteSuccess &&
                        current.productId == productItem.id) ||
                        (current is SetFavoriteError &&
                            current.productId == productItem.id) ||
                        (current is SetFavoriteLoading &&
                            current.productId == productItem.id),
                    builder: (context, state) {
                      if (state is SetFavoriteLoading) {
                        return SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const CircularProgressIndicator.adaptive(),
                        );
                      }
                      return InkWell(
                        onTap: () async {
                          await homeCubit.setFavorite(productItem, favoriteCubit);
                        },
                        child: (state is SetFavoriteSuccess
                            ? state.isFavorite
                            : productItem.isFavorite)
                            ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20.sp,
                        )
                            : Icon(
                          Icons.favorite_border,
                          size: 20.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          productItem.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Text(
          productItem.category,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        Text(
          '\$${productItem.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
