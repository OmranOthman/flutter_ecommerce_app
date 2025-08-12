// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionVendorModel _$PromotionVendorModelFromJson(
        Map<String, dynamic> json) =>
    _PromotionVendorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      media: json['media'] as String?,
      rating: json['rating'] as num?,
      cuisines: json['cuisines'] as String?,
      brandImage: json['brand_image'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      inOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$PromotionVendorModelToJson(
        _PromotionVendorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media': instance.media,
      'rating': instance.rating,
      'cuisines': instance.cuisines,
      'brand_image': instance.brandImage,
      'is_favorite': instance.isFavorite,
      'is_open': instance.inOpen,
    };
