import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/avatar_image.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingEditProfilePage extends StatelessWidget {
  const SettingEditProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ProfileCubit>()..getMyProfile(),
      child: EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  EditProfileView({
    super.key,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (value.length != 10) {
      return 'phone_must_be_10_digits'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_profile".tr,
          style: TextStyle(fontSize: 16),
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
          if (state.editSuccess) {
            showSnackBar(
              context,
              backgroundColor: Colors.green,
              msg: "edit_profile_successfully".tr,
            );
            profileCubit.getMyProfile();
          }
          if (state.errorMessageEdit != null) {
            showSnackBar(
              context,
              msg: state.errorMessageEdit!,
            );
          }
        },
        builder: (context, state) {
          if (state.errorMessage != null) {
            return ErrorMessageWidget(
              errorMessage: state.errorMessage!,
              onRetry: () => profileCubit.getMyProfile(),
            );
          }
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AvatarImage(
                            fileImage: state.profileEntity!.fileImage,
                            networkImage: state.profileEntity!.networkImage,
                            pickNewImage: profileCubit.pickNewImage,
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            label: 'username'.tr,
                            prefixIcon: Icon(Icons.person_outline, size: 24.w),
                            hintText: 'enter_username'.tr,
                            onChanged: profileCubit.userNameOnChanged,
                            initialValue: state.profileEntity!.fullName!,
                            validator: _validateUsername,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            enabled: false,
                            readOnly: true,
                            label: 'phone'.tr,
                            hintText: 'enter_your_phone'.tr,
                            keyboardType: TextInputType.phone,
                            prefixIcon: Icon(Icons.phone, size: 24.w),
                            initialValue: state.profileEntity!.fullPhone!,
                            validator: _validatePhone,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: CustomButton(
                      isLoading: state.editLoading,
                      text: "save_changes".tr,
                      onTap: () => profileCubit.editProfile(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
