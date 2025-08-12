import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/util/input_formatters/phone_input_formatter.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_country_code_picker.dart';
import 'package:flutter_ecommerce_app/core/widgets/dialogs/error_dialog.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/forgot_password_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/social_media_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginPage(),
      );

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<AuthCubit>()..getRememberData(),
        ),
        BlocProvider(create: (context) => di<VerificationCubit>()),
      ],
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

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (value.length != 8) {
      return 'phone_must_be_8_digits'.tr;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (value.length < 8) {
      return 'password_must_be_at_least_8_characters'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    VerificationCubit verificationCubit =
        BlocProvider.of<VerificationCubit>(context);

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
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  'please_login_with_registered_account'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
                SizedBox(height: 24.h),
                BlocBuilder<AuthCubit, AuthState>(
                  bloc: authCubit,
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            prefixIcon: const Icon(Icons.phone_outlined),
                            suffixIcon: CustomCountryCodePicker(
                              phoneCodeOnChanged: authCubit.phoneCodeChanged,
                            ),
                            label: 'phone'.tr,
                            hintText: 'enter_your_phone'.tr,
                            initialValue: state.phone,
                            onChanged: authCubit.phoneOnChanged,
                            validator: _validatePhone,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                              ArabicNumberTextInputFormatter(),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            label: 'password'.tr,
                            hintText: 'enter_your_password'.tr,
                            initialValue: state.password,
                            obscureText: _obscureText,
                            onChanged: authCubit.passwordOnChanged,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            validator: _validatePassword,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Text(
                              'remember_me'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Checkbox(
                                value: state.rememberMe,
                                onChanged: authCubit.rememberMeButtonOnChange),
                          ],
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        CustomBottomSheet.show<void>(
                            context: context,
                            child: ForgotPasswordBottomSheet(
                              verificationCubit: verificationCubit,
                              authCubit: authCubit,
                            ));
                      },
                      child: Text(
                        'forgot_password'.tr,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                BlocConsumer<AuthCubit, AuthState>(
                  bloc: authCubit,
                  listener: (context, state) {
                    if (state.errorMessage != null) {
                      ErrorDialog.show(
                        context,
                        errorMessage: state.errorMessage!,
                        title: "error".tr,
                      );
                    }
                    if (state.loginSuccessfully) {
                      if (!state.authResponse!.success!) {
                        showSnackBar(context,
                            msg: state.authResponse!.message!);
                        Navigator.of(context).pushNamed(
                          RoutePath.verificationRoute,
                          arguments: VerificationParams(
                              fullPhone: state.phoneCode + state.phone!),
                        );
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          RoutePath.mainRoute,
                          (route) => false,
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      text: 'login'.tr,
                      isLoading: state.isLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authCubit.login();
                        }
                      },
                    );
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
                          // authCubit.googleLogin();
                        },
                      ),
                      SizedBox(height: 16.h),
                      SocialMediaButton(
                        text: 'login_with_facebook'.tr,
                        img: AppAssets.images.logoFacebook,
                        onTap: () {
                          // Navigator.of(context).pushNamed(RoutePath.mainRoute);
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
