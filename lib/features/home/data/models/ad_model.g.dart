// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: json['id'],
      adId: json['ad_id'],
      adType: json['ad_type'],
      vendorId: json['vendor_id'],
      url: json['url'],
      collectionShowType: json['collection_show_type'],
      categoryShowType: json['category_show_type'],
      media: json['media'],
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'ad_id': instance.adId,
      'ad_type': instance.adType,
      'vendor_id': instance.vendorId,
      'url': instance.url,
      'collection_show_type': instance.collectionShowType,
      'category_show_type': instance.categoryShowType,
      'media': instance.media,
    };
