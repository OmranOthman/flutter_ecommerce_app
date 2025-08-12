part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final String? password;
  final String? passwordConfirmation;
  final bool isLoading;
  final String? errorMessage;
  final bool changePasswordSuccess;
  const ForgetPasswordState({
    this.password,
    this.passwordConfirmation,
    this.errorMessage,
    this.isLoading = false,
    this.changePasswordSuccess = false,
  });
  factory ForgetPasswordState.initial() => ForgetPasswordState();

  ForgetPasswordState copyWith({
    String? password,
    String? passwordConfirmation,
    bool? isLoading,
    String? errorMessage,
    bool? changePasswordSuccess,
  }) =>
      ForgetPasswordState(
          password: password ?? this.password,
          isLoading: isLoading ?? this.isLoading,
          errorMessage: errorMessage,
          passwordConfirmation:
              passwordConfirmation ?? this.passwordConfirmation,
          changePasswordSuccess:
              changePasswordSuccess ?? this.changePasswordSuccess);

  @override
  List<Object?> get props => [
        password,
        passwordConfirmation,
        isLoading,
        errorMessage,
        changePasswordSuccess,
      ];
}
