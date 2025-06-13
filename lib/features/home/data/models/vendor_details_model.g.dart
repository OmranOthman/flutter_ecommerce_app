// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDetailsModel _$VendorDetailsModelFromJson(Map<String, dynamic> json) =>
    VendorDetailsModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VendorDetailsModelToJson(VendorDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      legalName: json['legal_name'] as String,
      phone: json['phone'] as String,
      paymentMethods: (json['payment_methods'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      minOrder: (json['min_order'] as num).toInt(),
      discounts: json['discounts'] as List<dynamic>,
      collection: json['collection'] as String,
      location: json['location'],
      services: json['services'] as List<dynamic>,
      categoriesShowType: json['categories_show_type'] as String,
      productsShowType: json['products_show_type'] as String,
      cuisines:
          (json['cuisines'] as List<dynamic>).map((e) => e as String).toList(),
      isOpen: json['is_open'] as bool,
      openingHoursToday: json['opening_hours_today'] as List<dynamic>,
      brandImage: json['brand_image'] as String,
      media: (json['media'] as List<dynamic>).map((e) => e as String).toList(),
      categories: json['categories'] as List<dynamic>,
      tags: json['tags'] as List<dynamic>,
      isFavorite: json['is_favorite'] as bool,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'legal_name': instance.legalName,
      'phone': instance.phone,
      'payment_methods': instance.paymentMethods,
      'min_order': instance.minOrder,
      'discounts': instance.discounts,
      'collection': instance.collection,
      'location': instance.location,
      'services': instance.services,
      'categories_show_type': instance.categoriesShowType,
      'products_show_type': instance.productsShowType,
      'cuisines': instance.cuisines,
      'is_open': instance.isOpen,
      'opening_hours_today': instance.openingHoursToday,
      'brand_image': instance.brandImage,
      'media': instance.media,
      'categories': instance.categories,
      'tags': instance.tags,
      'is_favorite': instance.isFavorite,
    };
