// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesModel _$StatesModelFromJson(Map<String, dynamic> json) => StatesModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatesModelToJson(StatesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

StateData _$StateDataFromJson(Map<String, dynamic> json) => StateData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$StateDataToJson(StateData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
