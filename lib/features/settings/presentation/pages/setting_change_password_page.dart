import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_change_password_cubit/setting_change_password_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_change_password_cubit/setting_change_password_state.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class SettingChangePasswordPage extends StatelessWidget {
  const SettingChangePasswordPage({super.key, required Null Function() onDispose});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingChangePasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "change_password".tr,
            style: TextStyle(fontSize: 16.sp),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24.w),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, size: 24.w),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Container(color: Colors.grey.withOpacity(0.3), height: 1.h),
          ),
        ),
        body: const ChangePasswordView(),
      ),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late final FocusNode _newPasswordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        FocusScope.of(context).requestFocus(_newPasswordFocusNode);
      }
    });

    _newPasswordController.addListener(() {
      context.read<SettingChangePasswordCubit>().newPasswordChanged(_newPasswordController.text);
    });
    _confirmPasswordController.addListener(() {
      context.read<SettingChangePasswordCubit>().confirmPasswordChanged(_confirmPasswordController.text);
    });
  }

  @override
  void dispose() {
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingChangePasswordCubit, SettingChangePasswordState>(
      listenWhen: (previous, current) =>
      previous.errorMessage != current.errorMessage ||
          previous.success != current.success,
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("password_updated".tr),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SettingChangePasswordCubit, SettingChangePasswordState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                      label: "new_password".tr,
                      controller: _newPasswordController,
                      prefixIcon: Icon(Icons.lock_outline, size: 24.w),
                      hintText: "enter_new_password".tr,
                      obscureText: state.obscureNewPassword,
                      focusNode: _newPasswordFocusNode,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.obscureNewPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                          size: 24.w,
                        ),
                        onPressed: () => context.read<SettingChangePasswordCubit>().toggleObscureNewPassword(),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      label: "confirm_password".tr,
                      controller: _confirmPasswordController,
                      prefixIcon: Icon(Icons.lock_outline, size: 24.w),
                      hintText: "confirm_new_password".tr,
                      obscureText: state.obscureConfirmPassword,
                      focusNode: _confirmPasswordFocusNode,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                          size: 24.w,
                        ),
                        onPressed: () => context.read<SettingChangePasswordCubit>().toggleObscureConfirmPassword(),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  text: "update_password".tr,
                  onTap: () => context.read<SettingChangePasswordCubit>().submit(),
                  height: 48.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}