// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionAdModel _$CollectionAdModelFromJson(Map<String, dynamic> json) =>
    CollectionAdModel(
      id: (json['id'] as num).toInt(),
      image: json['media'] as String,
    );

Map<String, dynamic> _$CollectionAdModelToJson(CollectionAdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media': instance.image,
    };
