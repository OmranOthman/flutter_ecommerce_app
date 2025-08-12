// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num?)?.toInt(),
      variantId: (json['variant_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      media: json['media'] as String?,
      priceBeforeDiscount: (json['price_before_discount'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      quantityIncrement: (json['quantity_increment'] as num?)?.toInt(),
      purchasable: json['purchasable'] as String?,
      backorder: (json['backorder'] as num?)?.toInt(),
      minQuantity: (json['min_quantity'] as num?)?.toInt(),
      hasAddon: json['has_addon'] as bool?,
      bogo: json['bogo'] as bool?,
      isFavorite: json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant_id': instance.variantId,
      'name': instance.name,
      'description': instance.description,
      'category_id': instance.categoryId,
      'media': instance.media,
      'price_before_discount': instance.priceBeforeDiscount,
      'price': instance.price,
      'stock': instance.stock,
      'quantity_increment': instance.quantityIncrement,
      'purchasable': instance.purchasable,
      'backorder': instance.backorder,
      'min_quantity': instance.minQuantity,
      'has_addon': instance.hasAddon,
      'bogo': instance.bogo,
      'is_favorite': instance.isFavorite,
    };
