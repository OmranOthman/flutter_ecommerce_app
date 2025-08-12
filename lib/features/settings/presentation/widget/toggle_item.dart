import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isLast;
  final String? text;
  final double? subtitleWidth ;
  final double? subtitleHeight ;

  const ToggleItem({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.isLast = false,
    this.text,
    this.subtitleHeight,
    this.subtitleWidth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);



    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (text != null)
                      SizedBox(
                        width: subtitleWidth,
                        height: subtitleHeight,
                        child: Text(
                          text!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                  ],
                ),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  thumbColor: WidgetStateProperty.resolveWith<Color>(
                        (states) => states.contains(WidgetState.selected)
                        ? theme.colorScheme.primary
                        : Colors.grey.shade400,
                  ),
                  trackColor: WidgetStateProperty.resolveWith<Color>(
                        (states) => states.contains(WidgetState.selected)
                        ? theme.colorScheme.primary.withOpacity(0.3)
                        : Colors.grey.shade400.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          if (!isLast)
            Container(
              height: 1.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

}
