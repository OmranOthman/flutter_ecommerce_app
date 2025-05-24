import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';

class CreateNewPasswordBottomSheet extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onDispose;

  const CreateNewPasswordBottomSheet({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.onDispose,
  });

  @override
  State<CreateNewPasswordBottomSheet> createState() =>
      _CreateNewPasswordBottomSheetState();
}

class _CreateNewPasswordBottomSheetState
    extends State<CreateNewPasswordBottomSheet> {
  late final FocusNode _newPasswordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _newPasswordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        FocusScope.of(context).requestFocus(_newPasswordFocusNode);
      }
    });
  }

  @override
  void dispose() {
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        padding: EdgeInsets.only(
          top: 23.h,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24.w,
          right: 24.w,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 23.h),
                  Text(
                    'Create New Password',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Enter your new password and confirm it',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // New Password Field
                  CustomTextFormField(
                    label: 'New Password',
                    controller: widget.newPasswordController,
                    prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
                    hintText: 'Enter new password',
                    obscureText: _obscureNewPassword,
                    focusNode: _newPasswordFocusNode,
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
                  ),
                  SizedBox(height: 16.h),

                  // Confirm Password Field
                  CustomTextFormField(
                    label: 'Confirm Password',
                    controller: widget.confirmPasswordController,
                    prefixIcon: Icon(Icons.lock_outline, size: 20.sp),
                    hintText: 'Confirm new password',
                    obscureText: _obscureConfirmPassword,
                    focusNode: _confirmPasswordFocusNode,
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
                  ),
                  SizedBox(height: 32.h),

                  // Update Button
                  CustomButton(
                    text: "Update Password",
                    onTap: _validateAndSubmit,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSubmit() {
    if (widget.newPasswordController.text.isEmpty ||
        widget.confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (widget.newPasswordController.text !=
        widget.confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (widget.newPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password updated successfully'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
