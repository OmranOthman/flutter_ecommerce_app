part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoadingForgotPassword;
  final bool sendCodeSuccessfully;
  final String? errorMessageForgotPassword;

  const ForgotPasswordState({
    this.isLoadingForgotPassword = false,
    this.sendCodeSuccessfully = false,
    this.errorMessageForgotPassword,
  });

  factory ForgotPasswordState.init() {
    return ForgotPasswordState();
  }


  ForgotPasswordState copyWith({
    bool? isLoadingForgotPassword,
    bool? sendCodeSuccessfully,
    String? errorMessageForgotPassword,
    String? phoneCode,
    String? phone,
  }) => ForgotPasswordState(
    isLoadingForgotPassword:
    isLoadingForgotPassword ?? this.isLoadingForgotPassword,
    errorMessageForgotPassword: errorMessageForgotPassword,
    sendCodeSuccessfully: sendCodeSuccessfully ?? this.sendCodeSuccessfully,

  );

  @override
  List<Object?> get props => [
    isLoadingForgotPassword,
    errorMessageForgotPassword,
    sendCodeSuccessfully,
  ];
}