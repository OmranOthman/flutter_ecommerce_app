part of 'verification_cubit.dart';

class VerificationState extends Equatable {
  final bool isLoading;
  final int second;
  final bool resendCodeSuccessfully;
  final bool phoneVerifySuccessfully;
  final String? errorMessage;

  final String? otp;
  final String? verifyMessage;

  const VerificationState({
    this.isLoading = false,
    this.errorMessage,
    this.otp,
    this.verifyMessage,
    this.resendCodeSuccessfully = false,
    this.phoneVerifySuccessfully = false,
    this.second = 0,
  });

  factory VerificationState.init() => const VerificationState();

  VerificationState copyWith(
          {bool? isLoading,
          String? errorMessage,
          String? otp,
          String? verifyMessage,
          bool? resendCodeSuccessfully,
          bool? phoneVerifySuccessfully,
          int? second}) =>
      VerificationState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        verifyMessage: verifyMessage ?? this.verifyMessage,
        phoneVerifySuccessfully: phoneVerifySuccessfully ?? false,
        resendCodeSuccessfully: resendCodeSuccessfully ?? false,
        second: second ?? this.second,
      );

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        resendCodeSuccessfully,
        phoneVerifySuccessfully,
        verifyMessage,
        otp,
        second,
      ];
}
