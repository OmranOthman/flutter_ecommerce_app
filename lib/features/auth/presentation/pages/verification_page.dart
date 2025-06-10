import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  static Route<dynamic> route({
    required String params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => VerificationPage(fullPhone: params),
      );

  final String fullPhone;

  const VerificationPage({super.key, required this.fullPhone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<VerificationCubit>(),
      child: VerificationView(fullPhone: fullPhone , phoneCode: ""),
    );
  }
}

class VerificationView extends StatelessWidget {
  final String fullPhone;
  final String phoneCode;

  const VerificationView({
    super.key,
    required this.fullPhone,
    required this.phoneCode,
  });

  @override
  Widget build(BuildContext context) {
    VerificationCubit verificationCubit =
        BlocProvider.of<VerificationCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("verification".tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1.h),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.images.verification),
            SizedBox(height: 40.h),
            Text(
              "verification_code".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10.h),
            Text(
              "code_sent_message".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.grey3),
            ),
            SizedBox(height: 5.h),
            Text(
              fullPhone,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 40.h),
            BlocBuilder<VerificationCubit, VerificationState>(
              bloc: verificationCubit,
              builder: (context, state) {
                return OtpTextField(
                    numberOfFields: 4,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldWidth: 55.w,
                    showFieldAsBox: true,
                    keyboardType: TextInputType.number,
                    focusedBorderColor: Theme.of(context).primaryColor,
                    enabledBorderColor: Colors.grey.shade200,
                    cursorColor: Theme.of(context).primaryColor,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    borderColor: Colors.transparent,
                    onSubmit: verificationCubit.onCodeChanged);
              },
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<VerificationCubit, VerificationState>(
                bloc: verificationCubit,
                listener: (context, state) {
                  if (state.errorMessage != null) {
                    showSnackBar(context, msg: state.errorMessage!);
                  }

                  if (state.phoneVerifySuccessfully) {
                    _showSuccessBottomSheet(context);
                  }

                  if (state.resendCodeSuccessfully) {
                    showSnackBar(
                      context,
                      msg: state.verifyMessage!,
                      backgroundColor: Colors.green,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state.isLoading,
                    onTap: () {
                      if (state.otp == null || state.otp!.length != 4) {
                        showSnackBar(context,
                            msg: "please_fill_in_the_fields".tr);
                      } else {
                        verificationCubit.phoneVerify(fullPhone);
                      }
                    },
                    text: "submit".tr,
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "didn't_receive_code".tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                BlocBuilder<VerificationCubit, VerificationState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        if (state.second == 0) {
                          verificationCubit.resendCode(fullPhone);
                        }
                      },
                      child: Text(
                        state.second == 0
                            ? "resend".tr
                            : "${"resend".tr} ${state.second}",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => _buildSuccessContent(context),
    );
  }

  Widget _buildSuccessContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.images.success),
          SizedBox(height: 20.h),
          Text(
            "register_success".tr,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "congratulations_message".tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: "go_to_homepage".tr,
              onTap: () {
                Navigator.pushNamed(context, RoutePath.mainRoute);
              },
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
