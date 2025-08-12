// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_lines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartLinesModel _$CartLinesModelFromJson(Map<String, dynamic> json) =>
    _CartLinesModel(
      id: (json['id'] as num?)?.toInt(),
      purchasableType: json['purchasable_type'] as String?,
      purchasableId: (json['purchasable_id'] as num?)?.toInt(),
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      vendorServices: json['vendor_services'] as List<dynamic>?,
      media: json['media'] as String?,
      pricePerProduct: (json['price_per_product'] as num?)?.toInt(),
      priceBeforeDiscount: json['price_before_discount'] as String?,
      price: (json['price'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      purchasable: json['purchasable'] as String?,
      quantityIncrement: (json['quantity_increment'] as num?)?.toInt(),
      minQuantity: (json['min_quantity'] as num?)?.toInt(),
      unitQuantity: (json['unit_quantity'] as num?)?.toInt(),
      name: json['name'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      note: json['note'] as String?,
      meta: json['meta'] as List<dynamic>?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$CartLinesModelToJson(_CartLinesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchasable_type': instance.purchasableType,
      'purchasable_id': instance.purchasableId,
      'vendor_id': instance.vendorId,
      'vendor_services': instance.vendorServices,
      'media': instance.media,
      'price_per_product': instance.pricePerProduct,
      'price_before_discount': instance.priceBeforeDiscount,
      'price': instance.price,
      'stock': instance.stock,
      'purchasable': instance.purchasable,
      'quantity_increment': instance.quantityIncrement,
      'min_quantity': instance.minQuantity,
      'unit_quantity': instance.unitQuantity,
      'name': instance.name,
      'quantity': instance.quantity,
      'note': instance.note,
      'meta': instance.meta,
      'available': instance.available,
    };
