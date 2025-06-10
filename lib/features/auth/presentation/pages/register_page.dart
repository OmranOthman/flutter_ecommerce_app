import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/util/input_formatters/phone_input_formatter.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_country_code_picker.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                'create_account'.tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'start_shopping_with_account'.tr,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.grey),
              ),
              SizedBox(height: 24.h),
              BlocBuilder<AuthCubit, AuthState>(
                bloc: authCubit,
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          label: 'username'.tr,
                          hintText: 'enter_username'.tr,
                          onChanged: authCubit.nameOnChanged,
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
                          prefixIcon: const Icon(Icons.phone_outlined),
                          suffixIcon: CustomCountryCodePicker(
                            phoneCodeOnChanged:
                                authCubit.phoneCodeRegisterOnChanged,
                            countryCodeOnChanged:
                                authCubit.countryCodeRegisterChanged,
                          ),
                          label: 'phone'.tr,
                          hintText: 'enter_your_phone'.tr,
                          onChanged: authCubit.phoneRegisterOnChanged,
                          validator: (validator) {
                            if (validator == null || validator.isEmpty) {
                              return 'this_field_is_required'.tr;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                            ArabicNumberTextInputFormatter(),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          label: 'password'.tr,
                          hintText: 'enter_your_password'.tr,
                          obscureText: _obscurePassword,
                          onChanged: authCubit.passwordRegisterOnChanged,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
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
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          label: 'confirm_password'.tr,
                          hintText: 'confirm_password'.tr,
                          obscureText: _obscureConfirmPassword,
                          onChanged:
                              authCubit.passwordConfirmationRegisterOnChanged,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
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
                  );
                },
              ),
              SizedBox(height: 40.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.errorMessage != null) {
                    showSnackBar(context, msg: state.errorMessage!);
                  }
                  if (state.registerSuccessfully) {
                    Navigator.of(context).pushNamed(RoutePath.verificationRoute,
                        arguments:
                            state.registerEntity!.phone!);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state.isLoading,
                    text: 'create_account'.tr,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        authCubit.register();
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have_an_account".tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'login'.tr,
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
                text: 'login_with_google'.tr,
                img: AppAssets.images.logoGoogle,
                onTap: () {
                  Navigator.of(context).pushNamed(RoutePath.mainRoute);
                  // authCubit.googleLogin();
                },
              ),
              SizedBox(height: 16.h),
              SocialMediaButton(
                text: 'login_with_facebook'.tr,
                img: AppAssets.images.logoFacebook,
                onTap: () {
                  Navigator.of(context).pushNamed(RoutePath.mainRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
