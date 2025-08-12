import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class RestPasswordPage extends StatelessWidget {
  static Route<dynamic> route({
    required RestPasswordParams params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => RestPasswordPage(
          fullPhone: params.fullPhone,
          token: params.token,
        ),
      );

  final String fullPhone;
  final String token;
  const RestPasswordPage(
      {super.key, required this.fullPhone, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ForgetPasswordCubit>(),
      child: RestPasswordView(
        fullPhone: fullPhone,
        token: token,
      ),
    );
  }
}

class RestPasswordView extends StatefulWidget {
  final String fullPhone;
  final String token;
  const RestPasswordView(
      {super.key, required this.fullPhone, required this.token});

  @override
  State<RestPasswordView> createState() => _RestPasswordViewState();
}

class _RestPasswordViewState extends State<RestPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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
    ForgetPasswordCubit forgetPasswordCubit =
        BlocProvider.of<ForgetPasswordCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50.h),
                            Text(
                              'change_password'.tr,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'please_enter_your_new_password'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: AppColors.grey,
                                  ),
                            ),
                            SizedBox(height: 24.h),
                            BlocBuilder<ForgetPasswordCubit,
                                ForgetPasswordState>(
                              bloc: forgetPasswordCubit,
                              builder: (context, state) {
                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.h),
                                      CustomTextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        label: 'password'.tr,
                                        hintText: 'enter_your_password'.tr,
                                        obscureText: _obscureText1,
                                        onChanged: forgetPasswordCubit
                                            .passwordOnChanged,
                                        prefixIcon:
                                            const Icon(Icons.lock_outline),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText1
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText1 = !_obscureText1;
                                            });
                                          },
                                        ),
                                        validator: _validatePassword,
                                      ),
                                      SizedBox(height: 20.h),
                                      CustomTextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        label: 'password_confirmation'.tr,
                                        hintText:
                                            'enter_your_confirmation_password'
                                                .tr,
                                        obscureText: _obscureText2,
                                        onChanged: forgetPasswordCubit
                                            .passwordConfirmationOnChanged,
                                        prefixIcon:
                                            const Icon(Icons.lock_outline),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText2
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText2 = !_obscureText2;
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
                          ],
                        ),
                        Expanded(child: SizedBox.shrink()),
                        BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                          bloc: forgetPasswordCubit,
                          listener: (context, state) {
                            if (state.errorMessage != null) {
                              showSnackBar(context, msg: state.errorMessage!);
                            }
                            if (state.changePasswordSuccess) {
                              showSnackBar(context,
                                  msg: "password_changed_successfully".tr,
                                  backgroundColor: AppColors.greanColor);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                RoutePath.loginRoute,
                                (route) => false,
                              );
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 24.h),
                              child: CustomButton(
                                text: 'change_password'.tr,
                                isLoading: state.isLoading,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    forgetPasswordCubit.changePassword(
                                      fullPhone: widget.fullPhone,
                                      token: widget.token,
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
