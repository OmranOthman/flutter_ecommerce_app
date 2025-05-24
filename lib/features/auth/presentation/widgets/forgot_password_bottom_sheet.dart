import 'package:flutter/material.dart';
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
            'Forgot Password',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Enter your email or phone number',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            readOnly: true,
            label: 'Email or Phone Number',
            suffixIcon: Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
            controller: emailController,
            prefixIcon: Icon(Icons.email_outlined, size: 20.sp),
            hintText: 'Enter your email',
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Send Code",
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Reset link sent to ${emailController.text}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
