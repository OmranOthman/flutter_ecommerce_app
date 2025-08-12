import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreMarker extends StatelessWidget {
  const StoreMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        Icons.store,
        color: Colors.red[700],
        size: 28.sp,
      ),
    );
  }
}

class SelectedLocationMarker extends StatelessWidget {
  const SelectedLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40.sp,
          height: 40.sp,
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
        ),

        Container(
          width: 24.sp,
          height: 24.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue.shade700,
              width: 2.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 6.sp,
                spreadRadius: 1.sp,
              ),
            ],
          ),
        ),

        Container(
          width: 12.sp,
          height: 12.sp,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade700.withValues(alpha: 0.5),
                blurRadius: 4.sp,
                spreadRadius: 2.sp,
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 2.sp,
          child: CustomPaint(
            size: Size(8.sp, 12.sp),
            painter: _PointerPainter(color: Colors.blue.shade700),
          ),
        ),
      ],
    );
  }
}

class _PointerPainter extends CustomPainter {
  final Color color;

  _PointerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



class CurrentLocationMarker extends StatelessWidget {
  const CurrentLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.person_pin_circle,
            color: Colors.green[700],
            size: 28.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 2.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
          "You are here",
            style: TextStyle(
              fontSize: 6,
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}