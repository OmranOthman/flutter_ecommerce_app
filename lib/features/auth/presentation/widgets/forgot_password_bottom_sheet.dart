import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  final TextEditingController emailController;

  const ForgotPasswordBottomSheet({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'forgot_password'.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'enter_email_or_phone'.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            readOnly: true,
            label: 'email_or_phone'.tr,
            suffixIcon: Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
            controller: emailController,
            prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
            hintText: 'enter_your_email'.tr,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'send_code'.tr,
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${'reset_link_sent'.tr} ${emailController.text}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
