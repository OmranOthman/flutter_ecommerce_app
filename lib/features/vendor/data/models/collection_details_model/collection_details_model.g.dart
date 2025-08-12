// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectionDetailsModel _$CollectionDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _CollectionDetailsModel(
      collection: json['collection'] as String?,
      services: json['services'] as List<dynamic>?,
      subCollection: (json['subCollection'] as List<dynamic>?)
          ?.map(
              (e) => SubCollectionItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ads: (json['ads'] as List<dynamic>?)
          ?.map((e) => CollectionAdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      promotions: (json['promotions'] as List<dynamic>?)
          ?.map((e) =>
              CollectionPromotionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      popup: json['popup'],
    );

Map<String, dynamic> _$CollectionDetailsModelToJson(
        _CollectionDetailsModel instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'services': instance.services,
      'subCollection': instance.subCollection,
      'ads': instance.ads,
      'promotions': instance.promotions,
      'popup': instance.popup,
    };

_SubCollectionItemModel _$SubCollectionItemModelFromJson(
        Map<String, dynamic> json) =>
    _SubCollectionItemModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      media: json['media'] as String?,
    );

Map<String, dynamic> _$SubCollectionItemModelToJson(
        _SubCollectionItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'media': instance.media,
    };
