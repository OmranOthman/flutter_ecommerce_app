import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_model/vendor_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/vendor_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class VendorItem extends StatelessWidget {
  final VendorModel? vendor;

  const VendorItem({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return GestureDetector(
      onTap: () {
        if (vendor?.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorPage(vendorId: vendor!.id!),
            ),
          );
        }
      },
      child: SizedBox(
        width: 162.w,height: 255.h,
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
                  child: vendor?.brandImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            imageUrl: vendor!.brandImage!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : null,
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
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {},
                            child: Icon(
                              vendor?.isFavorite ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 20.sp,
                              color: vendor?.isFavorite ?? false
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
                vendor?.name ?? '', // name vendor
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            /// Add rating response API

            // Row(
            //   children: [
            //     Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //       size: 16.sp,
            //     ),
            //     SizedBox(width: 4.w),
            //     Text(
            //       vendor?.rating?.toStringAsFixed(1) ?? '0.0',
            //       style: Theme.of(context).textTheme.bodySmall,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
