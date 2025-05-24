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

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => di<AuthCubit>(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'Start shopping with create your account',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.grey),
              ),
              SizedBox(height: 24.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      label: 'username'.tr,
                      hintText: 'enter_your_username'.tr,
                      prefixIcon: const Icon(Icons.person_outline),
                      validator: (validator) {
                        if (validator == null || validator.isEmpty) {
                          return 'this_field_is_required'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
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
              SizedBox(height: 40.h),
              CustomButton(
                isLoading: false,
                text: 'Create Account',
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    // Call register logic
                  }
                },
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SocialMediaButton(
                text: 'Login with Google',
                img: AppAssets.images.logoGoogle,
                onTap: () {
                  Navigator.of(context).pushNamed(RoutePath.homeRoute);
                },
              ),
              SizedBox(height: 16.h),
              SocialMediaButton(
                text: 'Login with Facebook',
                img: AppAssets.images.logoFacebook,
                onTap: () {
                  Navigator.of(context).pushNamed(RoutePath.homeRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
