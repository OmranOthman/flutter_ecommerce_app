import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/entities/profile_entity.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  SettingsRepository settingsRepository;
  ProfileCubit({
    required this.settingsRepository,
  }) : super(ProfileState.init());

  Future<void> getMyProfile() async {
    emit(state.copyWith(isLoading: true));
    ApiResult<ProfileEntity, Failure> result =
        await settingsRepository.getMyProfile();

    if (result.errorResponse != null) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(
            result.errorResponse!,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          profileEntity: result.dataResponse,
        ),
      );
    }
  }

  Future<void> editProfile() async {
    emit(state.copyWith(editLoading: true));
    ApiResult<void, Failure> result = await settingsRepository.editMyProfile(
        profileEntity: state.profileEntity!);

    if (result.errorResponse != null) {
      emit(
        state.copyWith(
          editLoading: false,
          errorMessageEdit: failureHandlingMessage(
            result.errorResponse!,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          editLoading: false,
          editSuccess: true,
        ),
      );
    }
  }

  Future<void> changePassword() async {
    emit(state.copyWith(changePasswordLoading: true));
    ApiResult<void, Failure> result = await settingsRepository.changePassword(
        currentPassword: state.currentPassword!,
        newPassword: state.newPassword!,
        passwordConfirmation: state.passwordConfirmation!);

    if (result.errorResponse != null) {
      emit(
        state.copyWith(
          changePasswordLoading: false,
          changePasswordErrorMessage: failureHandlingMessage(
            result.errorResponse!,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          changePasswordLoading: false,
          changePasswordSuccess: true,
        ),
      );
    }
  }

  void pickNewImage(File fileImage) {
    emit(state.copyWith(
        profileEntity: state.profileEntity!.copyWith(fileImage: fileImage)));
  }

  void userNameOnChanged(String fullName) {
    emit(state.copyWith(
        profileEntity: state.profileEntity!.copyWith(fullName: fullName)));
  }

  void currentPasswordOnChanged(String currentPassword) {
    emit(state.copyWith(currentPassword: currentPassword));
  }

  void newPasswordOnChanged(String newPassword) {
    emit(state.copyWith(
      newPassword: newPassword,
    ));
  }

  void passwordConfirmationOnChanged(String passwordConfirmation) {
    emit(state.copyWith(passwordConfirmation: passwordConfirmation));
  }
}
