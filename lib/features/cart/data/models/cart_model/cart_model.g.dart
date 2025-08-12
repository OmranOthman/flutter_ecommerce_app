// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
      id: (json['id'] as num?)?.toInt(),
      meta: json['meta'],
      cartLines: (json['cart_lines'] as List<dynamic>?)
          ?.map((e) => CartLinesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'cart_lines': instance.cartLines,
    };
