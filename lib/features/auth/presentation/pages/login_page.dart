import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constans/app_distances.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/social_media_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widgets/create_new_password_bottom_sheet.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthCubit>(),
      child: LoginView(),
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

  // void _showForgotPasswordBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) => ForgotPasswordBottomSheet(
  //       emailController: emailController,
  //     ),
  //   );
  // }

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
            onDispose: () {
              // تأخير التخلص من الـ controllers لضمان عدم استخدامها بعد التخلص
              // Future.delayed(const Duration(milliseconds: 300), () {
              //   if (newPasswordController.hasListeners) {
              //     newPasswordController.dispose();
              //   }
              //   if (confirmPasswordController.hasListeners) {
              //     confirmPasswordController.dispose();
              //   }
              // });
            },
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppDistances.largePadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'login'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'please_login_with_registered_account'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        label: 'email'.tr,
                        hintText: 'enter_your_email'.tr,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        validator: (validator) {
                          if (validator == null || validator.isEmpty) {
                            return 'this_field_is_required'.tr;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        label: 'password'.tr,
                        hintText: 'enter_your_password'.tr,
                        obscureText:_obscureText ,
                     
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
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
                    onPressed: () {
                      _showCreateNewPasswordBottomSheet();
                    },
                    child: const Text('Forgot Password'),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Login',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(RoutePath.homeRoute);
                    }
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutePath.registerRoute);
                        },
                        child: const Text('Don\'t have an account? Register'),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Or using other method',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                      const SizedBox(height: 16),
                      SocialMediaButton(
                          text: 'Login with Google',
                          imgUrl:
                              'https://cdn.iconscout.com/icon/free/png-512/free-google-icon-download-in-svg-png-gif-file-formats--logo-social-media-1507807.png?f=webp&w=512',
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutePath.homeRoute);
                          }),
                      const SizedBox(height: 16),
                      SocialMediaButton(
                          text: 'Login with Facebook',
                          imgUrl:
                              'https://cdn.iconscout.com/icon/free/png-512/free-facebook-logo-icon-download-in-svg-png-gif-file-formats--fb-new-color-social-media-logos-icons-1350125.png?f=webp&w=512',
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutePath.homeRoute);
                          }),
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
