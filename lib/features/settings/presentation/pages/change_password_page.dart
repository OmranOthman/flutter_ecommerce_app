import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

class ChangePasswordPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const ChangePasswordPage(),
      );

  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<ProfileCubit>(),
      child: ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;

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
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "change_password".tr,
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: profileCubit,
        listener: (context, state) {
          if (state.changePasswordSuccess) {
            showSnackBar(
              context,
              msg: "change_password_success".tr,
              backgroundColor: Colors.green,
            );
            Navigator.pop(context);
          }
          if (state.changePasswordErrorMessage != null) {
            showSnackBar(
              context,
              msg: state.changePasswordErrorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          spacing: 15.h,
                          children: [
                            CustomTextFormField(
                              label: "current_password".tr,
                              prefixIcon: Icon(Icons.lock_outline, size: 24.w),
                              hintText: "enter_current_password".tr,
                              onChanged: profileCubit.currentPasswordOnChanged,
                              validator: _validatePassword,
                              obscureText: _obscureText1,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText1
                                     ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 24.w,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText1 = !_obscureText1;
                                  });
                                },
                              ),
                            ),
                            CustomTextFormField(
                              label: "new_password".tr,
                              prefixIcon: Icon(Icons.lock_outline, size: 24.w),
                              hintText: "enter_new_password".tr,
                              onChanged: profileCubit.newPasswordOnChanged,
                              validator: _validatePassword,
                              obscureText: _obscureText2,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText2
                                     ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 24.w,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                              ),
                            ),
                            CustomTextFormField(
                              label: "confirm_password".tr,
                              prefixIcon: Icon(Icons.lock_outline, size: 24.w),
                              hintText: "confirm_new_password".tr,
                              onChanged: profileCubit
                                  .passwordConfirmationOnChanged,
                              validator: _validatePassword,
                              obscureText: _obscureText3,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText3
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 24.w,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText3 = !_obscureText3;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomButton(
                  isLoading: state.changePasswordLoading,
                  text: "update_password".tr,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      profileCubit.changePassword();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}