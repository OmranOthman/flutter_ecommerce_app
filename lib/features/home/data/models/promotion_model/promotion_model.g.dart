// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) =>
    _PromotionModel(
      id: (json['id'] as num?)?.toInt(),
      sotType: json['sotType'] as String?,
      vendors: (json['vendors'] as List<dynamic>?)
          ?.map((e) => VendorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PromotionModelToJson(_PromotionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sotType': instance.sotType,
      'vendors': instance.vendors,
      'title': instance.title,
    };
