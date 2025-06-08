// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopupModel _$PopupModelFromJson(Map<String, dynamic> json) => PopupModel(
      id: (json['id'] as num?)?.toInt(),
      adId: (json['ad_id'] as num?)?.toInt(),
      adType: json['ad_type'],
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      collectionShowType: json['collection_show_type'],
      categoryShowType: json['category_show_type'],
      media: json['media'] as String?,
    );

Map<String, dynamic> _$PopupModelToJson(PopupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ad_id': instance.adId,
      'ad_type': instance.adType,
      'vendor_id': instance.vendorId,
      'url': instance.url,
      'collection_show_type': instance.collectionShowType,
      'category_show_type': instance.categoryShowType,
      'media': instance.media,
    };
