import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/models/location_item_model.dart';

class LocationItemWidget extends StatelessWidget {
  final Color borderColor;
  final VoidCallback onTap;
  final LocationItemModel location;

  const LocationItemWidget({
    super.key,
    this.borderColor = AppColors.grey,
    required this.onTap,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.city,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    '${location.city}, ${location.country}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 55.r,
                    backgroundColor: borderColor,
                  ),
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: CachedNetworkImageProvider(
                      location.imgUrl,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
