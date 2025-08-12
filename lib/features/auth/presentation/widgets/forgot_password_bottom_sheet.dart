import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/dialogs/error_dialog.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthCubit authCubit;
  final VerificationCubit verificationCubit;

  ForgotPasswordBottomSheet({
    super.key,
    required this.authCubit,
    required this.verificationCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'enter_phone'.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                ),
          ),
          SizedBox(height: 24.h),
          Form(
            key: _formKey,
            child: Directionality(
              textDirection: TextDirection.ltr,
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
          ),
          SizedBox(height: 20.h),
          BlocConsumer<VerificationCubit, VerificationState>(
            bloc: verificationCubit,
            listener: (context, state) {
              if (state.errorMessage != null) {
                ErrorDialog.show(
                  context,
                  errorMessage: state.errorMessage!,
                  title: "error".tr,
                );
              }
              if (state.verifyOtpSuccessfully) {
                Navigator.of(context).pushNamed(
                  RoutePath.verificationRoute,
                  arguments: VerificationParams(
                    fullPhone:
                        authCubit.state.phoneCode + authCubit.state.phone!,
                    forgetPasswordPage: true,
                  ),
                );
              }
              if (state.resendCodeSuccessfully) {
                showSnackBar(
                  context,
                  msg: state.verifyMessage!,
                  backgroundColor: Colors.green,
                );
                Navigator.of(context).pushNamed(
                  RoutePath.verificationRoute,
                  arguments: VerificationParams(
                    fullPhone:
                        authCubit.state.phoneCode + authCubit.state.phone!,
                    forgetPasswordPage: true,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state.isLoading,
                text: 'send_code'.tr,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    verificationCubit.resendCode(
                        authCubit.state.phoneCode + authCubit.state.phone!);
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
