part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String phoneCode;
  final String? password;
  final bool isLoading;
  final String? errorMassage;
  final String? fullName;
  final String? passwordConfirmation;
  final String? countryIsoCode;
  final String? otp;

  final RegisterEntity? registerEntity;

  const AuthState(
      {this.phone,
      this.phoneCode = "+963",
      this.password,
      this.isLoading = false,
      this.errorMassage,
      this.fullName,
      this.passwordConfirmation,
      this.countryIsoCode = 'SY',
      this.registerEntity,
      this.otp,
      });

  factory AuthState.init() => const AuthState(registerEntity: RegisterEntity());

  AuthState copyWith({
    String? phone,
    String? phoneCode,
    String? password,
    bool? isLoading,
    String? errorMassage,
    String? fullName,
    String? passwordConfirmation,
    String? countryIsoCode,
    RegisterEntity? registerEntity,
    String? otp,
  }) =>
      AuthState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        phoneCode: phoneCode ?? this.phoneCode,
        isLoading: isLoading ?? this.isLoading,
        errorMassage: errorMassage,
        fullName: fullName ?? this.fullName,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        countryIsoCode: countryIsoCode ?? this.countryIsoCode,
        registerEntity: registerEntity ?? this.registerEntity,
        otp: otp ?? this.otp,
      );

  @override
  List<Object?> get props => [
        phone,
        phoneCode,
        password,
        isLoading,
        errorMassage,
        fullName,
        passwordConfirmation,
        countryIsoCode,
        registerEntity,
        otp,
      ];
}

class LoginSuccessfully extends AuthState {}

class RegisterSuccessfully extends AuthState {}

class ResendCodeSuccessfully extends AuthState {
  final String? verifyMsg;
  const ResendCodeSuccessfully({this.verifyMsg});
}

class PhoneVerifySuccessfully extends AuthState {}
