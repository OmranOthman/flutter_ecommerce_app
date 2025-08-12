// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_lines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLinesModel _$OrderLinesModelFromJson(Map<String, dynamic> json) =>
    _OrderLinesModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      media: json['media'] as String?,
      purchasableType: json['purchasable_type'] as String?,
      purchasableId: (json['purchasable_id'] as num?)?.toInt(),
      unitPrice: (json['unit_price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      discountType: (json['discount_type'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$OrderLinesModelToJson(_OrderLinesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media': instance.media,
      'purchasable_type': instance.purchasableType,
      'purchasable_id': instance.purchasableId,
      'unit_price': instance.unitPrice,
      'quantity': instance.quantity,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
      'total': instance.total,
      'note': instance.note,
    };
