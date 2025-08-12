part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String? phone;
  final String phoneCode;
  final String? password;
  final bool isLoading;
  final bool loginSuccessfully;
  final bool rememberMe;
  final bool registerSuccessfully;
  final String? errorMessage;
  final String? fullName;
  final String? passwordConfirmation;
  final RegisterEntity? registerEntity;
  final AuthResponse? authResponse;

  const AuthState({
    this.phone,
    this.phoneCode = "+968",
    this.password,
    this.isLoading = false,
    this.rememberMe = false,
    this.errorMessage,
    this.fullName,
    this.passwordConfirmation,
    this.registerEntity,
    this.loginSuccessfully = false,
    this.registerSuccessfully = false,
    this.authResponse,
  });

  factory AuthState.init() => AuthState(
        registerEntity: RegisterEntity(),
        authResponse: AuthResponse(),
        rememberMe: false,
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
    AuthResponse? authResponse,
    bool? rememberMe,
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
        authResponse: authResponse ?? this.authResponse,
        rememberMe: rememberMe ?? this.rememberMe,
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
        authResponse,
        rememberMe,
      ];
}
