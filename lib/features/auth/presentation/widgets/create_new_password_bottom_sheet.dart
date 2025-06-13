import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';

class CreateNewPasswordBottomSheet extends StatefulWidget {
  const CreateNewPasswordBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      isDismissible: false,
      child: const CreateNewPasswordBottomSheet(),
    );
  }

  @override
  State<CreateNewPasswordBottomSheet> createState() =>
      _CreateNewPasswordBottomSheetState();
}

class _CreateNewPasswordBottomSheetState
    extends State<CreateNewPasswordBottomSheet> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'new_password'.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'enter_new_password'.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
            label: 'new_password'.tr,
            prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
            hintText: 'enter_new_password'.tr,
            obscureText: _obscureNewPassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureNewPassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
                size: 20.sp,
              ),
              onPressed: () {
                setState(() {
                  _obscureNewPassword = !_obscureNewPassword;
                });
              },
            ),
            validator: (validator) {
              if (validator == null || validator.isEmpty) {
                return 'this_field_is_required'.tr;
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            label: 'confirm_password'.tr,
            prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
            hintText: 'confirm_new_password'.tr,
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
                size: 20.sp,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            validator: (validator) {
              if (validator == null || validator.isEmpty) {
                return 'this_field_is_required'.tr;
              }
              return null;
            },
          ),
          SizedBox(height: 32.h),
          CustomButton(
            text: "update_password".tr,
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}