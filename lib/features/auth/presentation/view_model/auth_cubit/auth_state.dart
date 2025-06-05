part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String phoneCode;
  final String? password;
  final bool isLoading;
  final bool loginSuccessfully;
  final bool registerSuccessfully;

  final String? errorMessage;
  final String? fullName;
  final String? passwordConfirmation;

  final RegisterEntity? registerEntity;

  const AuthState({
    this.phone,
    this.phoneCode = "+963",
    this.password,
    this.isLoading = false,
    this.errorMessage,
    this.fullName,
    this.passwordConfirmation,
    this.registerEntity,
    this.loginSuccessfully = false,
    this.registerSuccessfully = false,
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
    bool? loginSuccessfully,
    bool? registerSuccessfully,
  }) =>
      AuthState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        phoneCode: phoneCode ?? this.phoneCode,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        fullName: fullName ?? this.fullName,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        registerEntity: registerEntity ?? this.registerEntity,
        loginSuccessfully: loginSuccessfully ?? false,
        registerSuccessfully: registerSuccessfully ?? false,
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
        registerEntity,
        loginSuccessfully,
        registerSuccessfully,
      ];
}
