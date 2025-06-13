import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_edit_profile_cubit/edit_profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  // Method to update all profile data
  void setUserData(String username, String email, {File? profileImage}) {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(ProfileLoaded(
        username: username,
        email: email,
        profileImage: profileImage ?? currentState.profileImage,
      ));
    } else {
      emit(ProfileLoaded(
        username: username,
        email: email,
        profileImage: profileImage,
      ));
    }
  }

  // Method to update only the profile image
  void updateProfileImage(File image) {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(currentState.copyWith(profileImage: image));
    } else {
      emit(ProfileLoaded(
        username: '',
        email: '',
        profileImage: image,
      ));
    }
  }
}