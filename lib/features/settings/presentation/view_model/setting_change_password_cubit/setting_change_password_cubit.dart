import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/setting_change_password_cubit/setting_change_password_state.dart';

class SettingChangePasswordCubit extends Cubit<SettingChangePasswordState> {
  SettingChangePasswordCubit() : super(SettingChangePasswordState());

  void newPasswordChanged(String value) {
    emit(state.copyWith(newPassword: value, errorMessage: null, success: false));
  }

  void confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: value, errorMessage: null, success: false));
  }

  void toggleObscureNewPassword() {
    emit(state.copyWith(obscureNewPassword: !state.obscureNewPassword));
  }

  void toggleObscureConfirmPassword() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  void submit() {
    if (state.newPassword.isEmpty || state.confirmPassword.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please fill all fields', success: false));
      return;
    }
    if (state.newPassword != state.confirmPassword) {
      emit(state.copyWith(errorMessage: 'Passwords do not match', success: false));
      return;
    }
    if (state.newPassword.length < 8) {
      emit(state.copyWith(errorMessage: 'Password must be at least 8 characters', success: false));
      return;
    }


    emit(state.copyWith(errorMessage: null, success: true));
  }
}
