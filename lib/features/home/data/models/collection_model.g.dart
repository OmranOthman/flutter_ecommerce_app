// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      showType: json['showType'],
      column: json['column'],
      tag: json['tag'],
      media: json['media'] as String?,
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'showType': instance.showType,
      'column': instance.column,
      'tag': instance.tag,
      'media': instance.media,
    };
