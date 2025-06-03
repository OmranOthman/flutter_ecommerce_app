part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String countryCode;
  final String? password;
  final bool isLoading;
  final bool isError;
  final String? errorMassage;

  const AuthState({
    this.phone,
    this.countryCode = "+963",
    this.password,
    this.isLoading = false,
    this.isError = false,
    this.errorMassage,
  });

  factory AuthState.init() => const AuthState();

  AuthState copyWith(
          {String? phone,
          String? countryCode,
          String? password,
          bool? isLoading,
          bool? isError,
          String? errorMassage}) =>
      AuthState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        countryCode: countryCode ?? this.countryCode,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMassage: errorMassage ?? this.errorMassage,
      );

  @override
  List<Object?> get props => [
        phone,
        countryCode,
        password,
        isLoading,
        isError,
        errorMassage,
      ];
}
