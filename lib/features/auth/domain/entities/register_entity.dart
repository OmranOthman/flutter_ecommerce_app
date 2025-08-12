import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? name;
  final String? password;
  final String? passwordConfirmation;
  final String? phone;
  final String phoneCode;
  final String countryCode;
  final String? guestUuid;

  const RegisterEntity({
    this.name,
    this.password,
    this.passwordConfirmation,
    this.phone,
    this.phoneCode = "+968",
    this.countryCode = "OM",
    this.guestUuid,
  });

  RegisterEntity copyWith({
    String? name,
    String? password,
    String? passwordConfirmation,
    String? phone,
    String? phoneCode,
    String? countryCode,
    String? guestUuid,
  }) =>
      RegisterEntity(
        name: name ?? this.name,
        password: password ?? this.password,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        phone: phone ?? this.phone,
        phoneCode: phoneCode ?? this.phoneCode,
        countryCode: countryCode ?? this.countryCode,
        guestUuid: guestUuid ?? this.guestUuid,
      );

  @override
  List<Object?> get props => [
        name,
        password,
        passwordConfirmation,
        phone,
        phoneCode,
        countryCode,
        guestUuid,
      ];
}
