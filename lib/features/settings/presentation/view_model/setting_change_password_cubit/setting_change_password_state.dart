class SettingChangePasswordState {
  final String newPassword;
  final String confirmPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final String? errorMessage; // null إذا لا يوجد خطأ
  final bool success;

  SettingChangePasswordState({
    this.newPassword = '',
    this.confirmPassword = '',
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
    this.errorMessage,
    this.success = false,
  });

  SettingChangePasswordState copyWith({
    String? newPassword,
    String? confirmPassword,
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    String? errorMessage,
    bool? success,
  }) {
    return SettingChangePasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
      errorMessage: errorMessage,
      success: success ?? false,
    );
  }
}
