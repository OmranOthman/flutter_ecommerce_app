import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;
  final String gender;
  final String birthday;
  final String phone;
  final String phone_code;
  final String country_code;
  final String? guest_uuid;

  RegisterEntity(
      {required this.name,
      required this.email,
      required this.password,
      required this.password_confirmation,
      required this.gender,
      required this.birthday,
      required this.phone,
      required this.phone_code,
      required this.country_code,
      this.guest_uuid});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        password,
        password_confirmation,
        gender,
        birthday,
        phone,
        phone_code,
        country_code,
        guest_uuid
      ];
}
