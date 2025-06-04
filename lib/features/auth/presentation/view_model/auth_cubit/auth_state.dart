part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String countryCode;
  final String? password;
  final bool isLoading;
  final String? errorMassage;
  final String? fullName;
  final String? passwordConfirmation;
  final String? countryIsoCode;

  const AuthState({
    this.phone,
    this.countryCode = "+963",
    this.password,
    this.isLoading = false,
    this.errorMassage,
    this.fullName,
    this.passwordConfirmation,
    this.countryIsoCode = 'SY',
  });

  factory AuthState.init() => const AuthState();

  AuthState copyWith({
    String? phone,
    String? countryCode,
    String? password,
    bool? isLoading,
    String? errorMassage,
    String? fullName,
    String? passwordConfirmation,
    String? countryIsoCode,
  }) =>
      AuthState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        countryCode: countryCode ?? this.countryCode,
        isLoading: isLoading ?? this.isLoading,
        errorMassage: errorMassage,
        fullName: fullName ?? this.fullName,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        countryIsoCode: countryIsoCode ?? this.countryIsoCode,
      );

  @override
  List<Object?> get props => [
        phone,
        countryCode,
        password,
        isLoading,
        errorMassage,
        fullName,
        passwordConfirmation,
        countryIsoCode,
      ];
}

class LoginSuccessfully extends AuthState {}
class RegisterSuccessfully extends AuthState {}
