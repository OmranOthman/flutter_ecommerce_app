// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_vendors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectionVendorModel _$CollectionVendorModelFromJson(
        Map<String, dynamic> json) =>
    _CollectionVendorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      cuisines: json['cuisines'] as String?,
      tags: json['tags'] as List<dynamic>?,
      brandImage: json['brand_image'] as String?,
      media: json['media'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      isOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$CollectionVendorModelToJson(
        _CollectionVendorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'cuisines': instance.cuisines,
      'tags': instance.tags,
      'brand_image': instance.brandImage,
      'media': instance.media,
      'is_favorite': instance.isFavorite,
      'is_open': instance.isOpen,
    };
