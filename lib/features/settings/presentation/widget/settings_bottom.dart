import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsBottom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;
  final bool isDestructive;
  final bool showArrow;

  const SettingsBottom({
    Key? key,
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
    this.isDestructive = false,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isDestructive ? Colors.red : Colors.black;
    final TextStyle titleStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: iconColor,
    );

    final TextStyle trailingStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
      fontSize: 12.sp,
      color: Colors.grey,
    );

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24.w),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: trailingStyle,
              ),
            if (showArrow) SizedBox(width: 8.w),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16.w),
          ],
        ),
      ),
    );
  }
}
