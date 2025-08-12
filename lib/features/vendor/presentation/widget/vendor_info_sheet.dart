import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_details_model/vendor_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VendorInfoSheet extends StatelessWidget {
  final VendorDetailsModel vendor;

  const VendorInfoSheet({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'vendor_information'.tr,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        _buildInfoRow(Icons.store, 'name'.tr, vendor.name!),
        if (vendor.description!.isNotEmpty)
          _buildInfoRow(Icons.description, 'description'.tr, vendor.description!),
        _buildInfoRow(Icons.phone, 'phone'.tr, vendor.phone!),
        if (vendor.location != null && vendor.location!['address'] != null)
          _buildInfoRow(Icons.location_on, 'address_vendor'.tr, vendor.location!['address']),
        _buildInfoRow(
          Icons.access_time,
          'Status:'.tr,
          vendor.isOpen! ? 'open_now'.tr : 'closed'.tr,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20.sp, color: AppColors.primary),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}