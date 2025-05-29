// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) =>
    PromotionModel(
      id: (json['id'] as num?)?.toInt(),
      sotType: json['sotType'] as String?,
      vendors: (json['vendors'] as List<dynamic>?)
          ?.map((e) => VendorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromotionModelToJson(PromotionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sotType': instance.sotType,
      'vendors': instance.vendors,
    };
