// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      cuisines: json['cuisines'] as String?,
      brandImage: json['brand_image'] as String?,
      media: json['media'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      isOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'cuisines': instance.cuisines,
      'brand_image': instance.brandImage,
      'media': instance.media,
      'is_favorite': instance.isFavorite,
      'is_open': instance.isOpen,
    };
