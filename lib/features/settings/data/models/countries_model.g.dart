// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      native: json['native'] as String,
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'native': instance.native,
    };
