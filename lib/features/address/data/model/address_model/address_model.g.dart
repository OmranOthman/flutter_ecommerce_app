// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lineOne: json['line_one'] as String?,
      lineTwo: json['line_two'] as String?,
      lineThree: json['line_three'] as String?,
      city: json['city'] as String?,
      contactPhone: json['contact_phone'] as String?,
      landmark: json['landmark'] as String?,
      location: json['location'] as String?,
      floor: json['floor'] as String?,
      houseNumber: json['house_number'] as String?,
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'country': instance.country,
      'state': instance.state,
      'line_one': instance.lineOne,
      'line_two': instance.lineTwo,
      'line_three': instance.lineThree,
      'city': instance.city,
      'contact_phone': instance.contactPhone,
      'landmark': instance.landmark,
      'location': instance.location,
      'floor': instance.floor,
      'house_number': instance.houseNumber,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
    };
