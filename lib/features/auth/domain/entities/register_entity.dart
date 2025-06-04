import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String name;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String phoneCode;
  final String countryCode;
  final String? guestUuid;

  const RegisterEntity({
    required this.name,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.phoneCode,
    required this.countryCode,
    this.guestUuid,
  });

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
