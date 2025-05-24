import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          CircleAvatar(),
          CustomTextFormField(
            label: 'username'.tr,
            prefixIcon: Icon(Icons.person_outline),
            hintText: 'enter_username'.tr,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            label: 'email_or_phone'.tr,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'enter_your_email'.tr,
          ),
          CustomButton(
            text: "save_changes".tr,
          )
        ],
      ),
    );
  }
}