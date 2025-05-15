import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/social_media_button.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/widget/label_with_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(),
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
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text('Create Account',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Start shopping with create your account',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.grey),
                ),
                const SizedBox(height: 24),
                LabelWithTextField(
                  label: 'Username',
                  controller: usernameController,
                  prefixIcon: Icons.person_outline,
                  hintText: 'Enter your username',
                ),
                const SizedBox(height: 24),
                LabelWithTextField(
                  label: 'Email or Phone Number',
                  controller: emailController,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Enter your email',
                ),
                const SizedBox(height: 24),
                LabelWithTextField(
                  label: 'Password',
                  controller: passwordController,
                  prefixIcon: Icons.lock_outline,
                  hintText: 'Enter your password',
                  obsecureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 40),
                BlocConsumer<AuthCubit, AuthState>(
                  bloc: cubit,
                  listenWhen: (previous, current) =>
                  current is AuthDone || current is AuthError,
                  listener: (context, state) {
                    if (state is AuthDone) {
                      Navigator.of(context).pushNamed(AppRoutes.homeRoute);
                    } else if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  buildWhen: (previous, current) =>
                  current is AuthLoading ||
                      current is AuthError ||
                      current is AuthDone,
                  builder: (context, state) {
                    return MainButton(
                      isLoading: state is AuthLoading,
                      text: 'Create Account',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await cubit.registerWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            usernameController.text,
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
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('You have an account? Login'),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Or using other method',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 16),
                      // Google Button
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
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return SocialMediaButton(
                            isLoading: state is GoogleAuthenticating,
                            text: 'SignUp with Google',
                            imgUrl:
                            'https://cdn.iconscout.com/icon/free/png-512/free-google-icon-download-in-svg-png-gif-file-formats--logo-social-media-1507807.png?f=webp&w=512',
                            onTap: () => cubit.authenticateWithGoogle(),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      // Facebook Button
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
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return SocialMediaButton(
                            isLoading: state is FacebookAuthenticating,
                            text: 'SignUp with Facebook',
                            imgUrl:
                            'https://cdn.iconscout.com/icon/free/png-512/free-facebook-logo-icon-download-in-svg-png-gif-file-formats--fb-new-color-social-media-logos-icons-1350125.png?f=webp&w=512',
                            onTap: () => cubit.authenticateWithFacebook(),
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
    );
  }
}
