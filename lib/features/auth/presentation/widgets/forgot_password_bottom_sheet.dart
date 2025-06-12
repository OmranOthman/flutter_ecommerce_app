import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthCubit authCubit;
  final ForgotPasswordCubit forgotPasswordCubit;

  ForgotPasswordBottomSheet({
    super.key,
    required this.authCubit,
    required this.forgotPasswordCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 8.w),
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
          SizedBox(height: 8.h),
          Text(
            'enter_phone'.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(height: 24.h),
          Form(
            key: _formKey,
            child: CustomTextFormField(
              controller: TextEditingController(
                  text:
                      "${authCubit.state.phoneCode}${authCubit.state.phone ?? ""}"),
              readOnly: true,
              enabled: false,
              label: 'phone'.tr,
              suffixIcon:
                  Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
              prefixIcon: Icon(Icons.phone_outlined, size: 20.sp),
              hintText: 'enter_your_phone'.tr,
              validator: (validator) {
                if (validator == null || validator.isEmpty) {
                  return 'this_field_is_required'.tr;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20.h),
          BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            bloc: forgotPasswordCubit,
            listener: (context, state) {
              if (state.errorMessageForgotPassword != null) {
                showSnackBar(context, msg: state.errorMessageForgotPassword!);
              }
              if (state.sendCodeSuccessfully) {
                Navigator.of(context).pushNamed(
                  RoutePath.verifyChangePasswordRoute,
                  arguments: authCubit.state.phoneCode + authCubit.state.phone!,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state.isLoadingForgotPassword,
                text: 'send_code'.tr,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    forgotPasswordCubit.forgetPassword(
                      phone: authCubit.state.phone!,
                      phoneCode: authCubit.state.phoneCode,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
