import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      label: 'username'.tr,
                      hintText: 'enter_your_username'.tr,
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ),
                      validator: (validator) {
                        if (validator == null || validator.isEmpty) {
                          return 'this_field_is_required'.tr;
                        }
                        return null;
                      },
                    ),
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
              const SizedBox(height: 40),
              CustomButton(
                isLoading: false,
                // state is AuthLoading,
                text: 'Create Account',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
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
                 
              
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
