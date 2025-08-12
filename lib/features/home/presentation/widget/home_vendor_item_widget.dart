import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/vendor_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeVendorItemWidget extends StatelessWidget {
  const HomeVendorItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.promotions.length,
          itemBuilder: (context, index1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    state.promotions[index1].title ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: state.promotions[index1].vendors?.length ?? 0,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VendorPage(
                                  vendorId: state
                                      .promotions[index1].vendors![index2].id!),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 162.w,
                          height: 255.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4.h,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 145.h,
                                    width: 154.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: AppColors.grey2,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: CachedNetworkImage(
                                        imageBuilder: (context,
                                                imageProvider) =>
                                      
                                            Image(image: imageProvider),
                                        imageUrl: state.promotions[index1]
                                            .vendors![index2].brandImage!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: AppColors.greyColor
                                              .withValues(alpha: 0.5),
                                          highlightColor:
                                              AppColors.greyLightColor,
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
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
                                        child:
                                            BlocBuilder<HomeCubit, HomeState>(
                                          bloc: homeCubit,
                                          builder: (context, state) {
                                            return InkWell(
                                              onTap: () {
                                                homeCubit.toggleFavorite(
                                                    vendorId: state
                                                        .promotions[index1]
                                                        .vendors![index2]
                                                        .id!);
                                              },
                                              child: Icon(
                                                state
                                                            .promotions[index1]
                                                            .vendors![index2]
                                                            .isFavorite ??
                                                        false
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 20,
                                                color: state
                                                            .promotions[index1]
                                                            .vendors![index2]
                                                            .isFavorite ??
                                                        false
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 154.w,
                                child: Text(
                                  state.promotions[index1].vendors![index2]
                                          .name ??
                                      '', // name vendor
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            );
          },
        );
      },
    );
  }
}
