import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/social_media_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/create_new_password_bottom_sheet.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void _showCreateNewPasswordBottomSheet() {
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: CreateNewPasswordBottomSheet(
            newPasswordController: newPasswordController,
            confirmPasswordController: confirmPasswordController,
            onDispose: () {},
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Text(
                  'login'.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  'please_login_with_registered_account'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        label: 'email'.tr,
                        hintText: 'enter_your_email'.tr,
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (validator) {
                          if (validator == null || validator.isEmpty) {
                            return 'this_field_is_required'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        label: 'password'.tr,
                        hintText: 'enter_your_password'.tr,
                        obscureText: _obscureText,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
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
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _showCreateNewPasswordBottomSheet,
                    child: Text(
                      'forgot_password'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  text: 'login'.tr,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(RoutePath.mainRoute);
                    }
                  },
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't_have_account".tr,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutePath.registerRoute);
                            },
                            child: Text(
                              'register'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'or_using_other_method'.tr,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SocialMediaButton(
                        text: 'login_with_google'.tr,
                        img: AppAssets.images.logoGoogle,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RoutePath.verificationRoute);
                        },
                      ),
                      SizedBox(height: 16.h),
                      SocialMediaButton(
                        text: 'login_with_facebook'.tr,
                        img: AppAssets.images.logoFacebook,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RoutePath.mainRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
