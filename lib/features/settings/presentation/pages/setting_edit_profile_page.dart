import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_edit_profile_cubit/edit_profile_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class SettingEditProfilePage extends StatelessWidget {
  const SettingEditProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
  });

  Future<void> _pickImage(BuildContext context) async {
    try {
      var status = await Permission.photos.request();
      if (status.isGranted) {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 85,
        );

        if (image != null && context.mounted) {
          final File imageFile = File(image.path);
          context.read<ProfileCubit>().updateProfileImage(imageFile);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission denied')),
        );
      }
    } catch (e) {
      print("'Error: $e'");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_profile".tr,
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          File? profileImage;
          String username = '';
          String email = '';

          if (state is ProfileLoaded) {
            profileImage = state.profileImage;
            username = state.username;
            email = state.email;
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async{ await _pickImage(context);},
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundImage: profileImage != null
                                ? FileImage(profileImage)
                                : null,
                            child: profileImage == null
                                ? const Icon(Icons.person, size: 50)
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 24.r,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 24.h),
                    CustomTextFormField(
                      label: 'username'.tr,
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'enter_username'.tr,
                      initialValue: username,
                    ),
                     SizedBox(height: 24.h),
                    CustomTextFormField(
                      label: 'email_or_phone'.tr,
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'enter_your_email'.tr,
                      initialValue: email,
                    ),
                  ],
                ),
                 SizedBox(height: 32.h),
                CustomButton(
                  text: "save_changes".tr,
                  onTap: () {
                    // Handle save changes
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}