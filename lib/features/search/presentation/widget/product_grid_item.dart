import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/vendor_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ProductSearchItem extends StatelessWidget {
  final SearchProductModel product;

  const ProductSearchItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.productDetailsRoute,
          arguments: product.id,
        );
      },
      child: SizedBox(
        width: 162.w,height: 255.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 145.h,
                  width: 154.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: product.media ?? '',
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Icon(Icons.favorite_border,
                          size: 20.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Center(
              child: Text(
                product.name ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4.h),
            Center(
              child: Text(
                "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.green,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VendorSearchItem extends StatelessWidget {
  final SearchModel vendor;

  const VendorSearchItem({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (vendor.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VendorPage(vendorId: vendor.id!),
            ),
          );
        }
      },
      child: SizedBox(
        width: 162.w,height: 255.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 145.h,
                  width: 154.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: vendor.media ?? '',
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Icon(Icons.favorite_border,
                          size: 20.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Center(
              child: Text(
                vendor.name ?? '',
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
  }
}
