// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltersModel _$FiltersModelFromJson(Map<String, dynamic> json) => FiltersModel(
      cuisines: (json['cuisines'] as List<dynamic>)
          .map((e) => Cuisine.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: json['tags'] as List<dynamic>,
    );

Map<String, dynamic> _$FiltersModelToJson(FiltersModel instance) =>
    <String, dynamic>{
      'cuisines': instance.cuisines,
      'tags': instance.tags,
    };

Cuisine _$CuisineFromJson(Map<String, dynamic> json) => Cuisine(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CuisineToJson(Cuisine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
