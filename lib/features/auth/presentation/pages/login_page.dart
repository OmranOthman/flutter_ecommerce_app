import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/social_media_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/create_new_password_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/forgot_password_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/label_with_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
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
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _showForgotPasswordBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ForgotPasswordBottomSheet(
        emailController: emailController,
      ),
    );
  }

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
              Future.delayed(const Duration(milliseconds: 300), () {
                if (newPasswordController.hasListeners) {
                  newPasswordController.dispose();
                }
                if (confirmPasswordController.hasListeners) {
                  confirmPasswordController.dispose();
                }
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Login Account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please, login with registered account!',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 24),
                  LabelWithTextField(
                    label: 'Email or Phone Number',
                    controller: emailController,
                    prefixIcon: Icons.email_outlined,
                    hintText: 'Enter you email',
                  ),
                  const SizedBox(height: 24),
                  LabelWithTextField(
                    label: 'Password',
                    controller: passwordController,
                    prefixIcon: Icons.lock_outline,
                    hintText: 'Enter you password',
                    obsecureText: _obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _showForgotPasswordBottomSheet();
                      },
                      child: const Text('Forgot Password'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<AuthCubit, AuthState>(
                    bloc: cubit,
                    listenWhen: (previous, current) =>
                        current is AuthDone || current is AuthError,
                    listener: (context, state) {
                      if (state is AuthDone) {
                        Navigator.of(context).pushNamed(AppRoutes.homeRoute);
                      } else if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is AuthLoading ||
                        current is AuthError ||
                        current is AuthDone,
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return MainButton(
                          isLoading: true,
                        );
                      }
                      return MainButton(
                        text: 'Login',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await cubit.loginWithEmailAndPassword(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      );
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
                                .pushNamed(AppRoutes.registerRoute);
                          },
                          child: const Text('Don\'t have an account? Register'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Or using other method',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColors.grey,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        BlocConsumer<AuthCubit, AuthState>(
                          bloc: cubit,
                          listenWhen: (previous, current) =>
                              current is GoogleAuthDone ||
                              current is GoogleAuthError,
                          listener: (context, state) {
                            if (state is GoogleAuthDone) {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.homeRoute);
                            } else if (state is GoogleAuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          buildWhen: (previous, current) =>
                              current is GoogleAuthenticating ||
                              current is GoogleAuthError ||
                              current is GoogleAuthDone,
                          builder: (context, state) {
                            if (state is GoogleAuthenticating) {
                              return SocialMediaButton(
                                isLoading: true,
                              );
                            }
                            return SocialMediaButton(
                              text: 'Login with Google',
                              imgUrl:
                                  'https://cdn.iconscout.com/icon/free/png-512/free-google-icon-download-in-svg-png-gif-file-formats--logo-social-media-1507807.png?f=webp&w=512',
                              // onTap: () async =>
                              //     await cubit.authenticateWithGoogle(),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.verificationRoute);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocConsumer<AuthCubit, AuthState>(
                          bloc: cubit,
                          listenWhen: (previous, current) =>
                              current is FacebookAuthDone ||
                              current is FacebookAuthError,
                          listener: (context, state) {
                            if (state is FacebookAuthDone) {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.homeRoute);
                            } else if (state is FacebookAuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is FacebookAuthenticating) {
                              return SocialMediaButton(
                                isLoading: true,
                              );
                            }
                            return SocialMediaButton(
                              text: 'Login with Facebook',
                              imgUrl:
                                  'https://cdn.iconscout.com/icon/free/png-512/free-facebook-logo-icon-download-in-svg-png-gif-file-formats--fb-new-color-social-media-logos-icons-1350125.png?f=webp&w=512',
                              onTap: () async =>
                                  await cubit.authenticateWithFacebook(),
                            );
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
      ),
    );
  }
}
