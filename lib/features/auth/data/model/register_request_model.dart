import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/entities/register_entity.dart';

class RegisterRequestModel extends RegisterEntity {
  const RegisterRequestModel({
    required super.name,
    required super.password,
    required super.passwordConfirmation,
    required super.phone,
    required super.phoneCode,
    required super.countryCode,
    String super.guestUuid = '',
  });

  FormData toFormData() {
    return FormData.fromMap({
      'name': name,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'phone_code': phoneCode,
      'country_code': countryCode,
      'guest_uuid': guestUuid ?? '',
    });
  }
}
