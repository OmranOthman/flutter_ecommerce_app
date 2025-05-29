import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "order_tracking".tr,
          style: textTheme.headlineMedium?.copyWith(fontSize: 22.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: Image.asset(
              'assets/map_placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        margin: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Theme.of(context).dividerColor),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 24.r,
                          backgroundImage: const AssetImage('/.png'),
                        ),
                        title: Text(
                          'Alexander Jr'.tr,
                          style: textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                        ),
                        subtitle: Text(
                          'courier'.tr,
                          style: textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.public, size: 24.sp),
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                            ),
                            IconButton(
                              icon: Icon(Icons.call_outlined, size: 24.sp),
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    Text(
                      'progress_of_order'.tr,
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(height: 16.h),

                    // Timeline
                    _buildTimelineItem(
                      context,
                      isFirst: true,
                      icon: Icons.store,
                      title: 'unbox_bag'.tr,
                      subtitle: 'shop_time'.tr,
                    ),
                    _buildTimelineItem(
                      context,
                      icon: Icons.local_shipping,
                      title: 'on_the_way'.tr,
                      subtitle: 'delivery_time'.tr,
                    ),
                    _buildTimelineItem(
                      context,
                      isLast: true,
                      icon: Icons.location_pin,
                      title: 'delivery_address'.tr,
                      subtitle: 'house_time'.tr,
                    ),

                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: Text(
                          'mark_as_done'.tr,
                          style: textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        bool isFirst = false,
        bool isLast = false,
      }) {
    final textTheme = Theme.of(context).textTheme;

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 30.w,
        height: 30.h,
        indicator: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(icon, size: 16.sp, color: Colors.white),
        ),
      ),
      beforeLineStyle: LineStyle(
        color: Theme.of(context).primaryColor,
        thickness: 2.w,
      ),
      endChild: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: textTheme.bodyMedium
                  ?.copyWith(color: Theme.of(context).disabledColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}