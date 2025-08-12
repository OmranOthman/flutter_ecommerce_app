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
    super.guestUuid = '',
  });

  RegisterRequestModel.fromEntity(RegisterEntity registerEntity) :this(
    name: registerEntity.name,
    password: registerEntity.password,
    passwordConfirmation: registerEntity.passwordConfirmation,
    phone: registerEntity.phone,
    countryCode: registerEntity.countryCode,
    phoneCode: registerEntity.phoneCode,
    guestUuid: registerEntity.guestUuid,
  );

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
