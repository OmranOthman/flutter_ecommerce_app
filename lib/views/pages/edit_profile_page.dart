import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/bottom/main_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
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
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
          // LabelWithTextField(
          //   label: 'Username',
          //   controller: usernameController,
          //   prefixIcon: Icons.person_outline,
          //   hintText: 'Enter you username',
          // ),
          // const SizedBox(height: 24),
          // LabelWithTextField(
          //   label: 'Email or Phone Number',
          //   controller: emailController,
          //   prefixIcon: Icons.email_outlined,
          //   hintText: 'Enter you email',
          // ),
          MainButton(
            text: "Save Changes",
          )
        ],
      ),
    );
  }
}
