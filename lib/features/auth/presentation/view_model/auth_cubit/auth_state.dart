part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String phoneCode;
  final String? password;
  final bool isLoading;
  final bool loginSuccessfully;
  final bool registerSuccessfully;
  final bool resendCodeSuccessfully;
  final bool phoneVerifySuccessfully;
  final String? errorMessage;
  final String? fullName;
  final String? passwordConfirmation;
  final String? countryIsoCode;
  final String? otp;
  final String? verifyMessage;

  final RegisterEntity? registerEntity;

  const AuthState({
    this.phone,
    this.phoneCode = "+963",
    this.password,
    this.isLoading = false,
    this.errorMessage,
    this.fullName,
    this.passwordConfirmation,
    this.countryIsoCode = 'SY',
    this.registerEntity,
    this.otp,
    this.verifyMessage,
    this.loginSuccessfully = false,
    this.registerSuccessfully = false,
    this.resendCodeSuccessfully = false,
    this.phoneVerifySuccessfully = false,
  });

  factory AuthState.init() => const AuthState(
        registerEntity: RegisterEntity(),
      
      );

  AuthState copyWith({
    String? phone,
    String? phoneCode,
    String? password,
    bool? isLoading,
    String? errorMessage,
    String? fullName,
    String? passwordConfirmation,
    String? countryIsoCode,
    RegisterEntity? registerEntity,
    String? otp,
    String? verifyMessage,
    bool? loginSuccessfully,
    bool? registerSuccessfully,
    bool? resendCodeSuccessfully,
    bool? phoneVerifySuccessfully,
  }) =>
      AuthState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        phoneCode: phoneCode ?? this.phoneCode,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        fullName: fullName ?? this.fullName,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        countryIsoCode: countryIsoCode ?? this.countryIsoCode,
        registerEntity: registerEntity ?? this.registerEntity,
        otp: otp ?? this.otp,
        verifyMessage: verifyMessage ?? this.verifyMessage,
        loginSuccessfully: loginSuccessfully ?? false,
        registerSuccessfully: registerSuccessfully ?? false,
        phoneVerifySuccessfully: phoneVerifySuccessfully ?? false,
        resendCodeSuccessfully: resendCodeSuccessfully ?? false,
        
      );

  @override
  List<Object?> get props => [
        phone,
        phoneCode,
        password,
        isLoading,
        errorMessage,
        fullName,
        passwordConfirmation,
        countryIsoCode,
        registerEntity,
        loginSuccessfully,
        registerSuccessfully,
        resendCodeSuccessfully,
        phoneVerifySuccessfully,
        verifyMessage,
        otp,
      ];
}
