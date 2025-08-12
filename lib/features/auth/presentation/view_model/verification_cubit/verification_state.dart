part of 'verification_cubit.dart';

class VerificationState extends Equatable {
  final bool isLoading;
  final int second;
  final bool resendCodeSuccessfully;
  final bool phoneVerifySuccessfully;
  final bool verifyOtpSuccessfully;
  final String? errorMessage;
  final String? token;

  final String? otp;
  final String? verifyMessage;

  const VerificationState(
      {this.isLoading = false,
      this.errorMessage,
      this.otp,
      this.verifyMessage,
      this.resendCodeSuccessfully = false,
      this.phoneVerifySuccessfully = false,
      this.verifyOtpSuccessfully = false,
      this.second = 0,
      this.token});

  factory VerificationState.init() => const VerificationState();

  VerificationState copyWith(
          {bool? isLoading,
          String? errorMessage,
          String? otp,
          String? verifyMessage,
          bool? resendCodeSuccessfully,
          bool? phoneVerifySuccessfully,
          bool? verifyOtpSuccessfully,
          String? token,
          int? second}) =>
      VerificationState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        verifyMessage: verifyMessage ?? this.verifyMessage,
        phoneVerifySuccessfully: phoneVerifySuccessfully ?? false,
        resendCodeSuccessfully: resendCodeSuccessfully ?? false,
        token: token ?? this.token,
        verifyOtpSuccessfully:
            verifyOtpSuccessfully ?? this.verifyOtpSuccessfully,
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
        verifyOtpSuccessfully,
        token,
      ];
}
