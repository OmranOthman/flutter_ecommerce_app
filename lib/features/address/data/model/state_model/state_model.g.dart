// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StateModel _$StateModelFromJson(Map<String, dynamic> json) => _StateModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StateModelToJson(_StateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
