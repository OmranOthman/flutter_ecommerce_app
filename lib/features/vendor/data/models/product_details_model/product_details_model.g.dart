// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    _ProductDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      variantId: (json['variant_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      sku: json['sku'] as String?,
      minQuantity: (json['min_quantity'] as num?)?.toInt(),
      quantityIncrement: (json['quantity_increment'] as num?)?.toInt(),
      backorderQuantity: (json['backorder_quantity'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      purchasable: json['purchasable'] as String?,
      priceBeforeDiscount: json['price_before_discount'],
      price: json['price'] as num?,
      addons: json['addons'] as List<dynamic>?,
      tags: json['tags'] as List<dynamic>?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isFavorite: json['is_favorite'] as bool?,
      bogo: json['bogo'] as bool?,
      sizes:
          (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        _ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendorId,
      'variant_id': instance.variantId,
      'name': instance.name,
      'description': instance.description,
      'sku': instance.sku,
      'min_quantity': instance.minQuantity,
      'quantity_increment': instance.quantityIncrement,
      'backorder_quantity': instance.backorderQuantity,
      'stock': instance.stock,
      'purchasable': instance.purchasable,
      'price_before_discount': instance.priceBeforeDiscount,
      'price': instance.price,
      'addons': instance.addons,
      'tags': instance.tags,
      'media': instance.media,
      'is_favorite': instance.isFavorite,
      'bogo': instance.bogo,
      'sizes': instance.sizes,
    };
