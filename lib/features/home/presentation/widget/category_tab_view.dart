import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: InkWell(
            onTap: () {},
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: category.bgColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 32.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: category.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${category.productsCount} Products',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: category.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
