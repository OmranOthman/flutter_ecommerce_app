// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) =>
    AppSettingsModel(
      data: AppSettingsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppSettingsModelToJson(AppSettingsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AppSettingsData _$AppSettingsDataFromJson(Map<String, dynamic> json) =>
    AppSettingsData(
      location: json['location'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      twitter: json['twitter'] as String?,
      linkedin: json['linkedin'] as String?,
      youtube: json['youtube'] as String?,
      terms: json['terms'] as String?,
      splash: json['splash'] as String?,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AppSettingsDataToJson(AppSettingsData instance) =>
    <String, dynamic>{
      'location': instance.location,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'youtube': instance.youtube,
      'terms': instance.terms,
      'splash': instance.splash,
      'currency': instance.currency,
    };
