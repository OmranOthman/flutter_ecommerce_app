// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollectionPromotionModel _$CollectionPromotionModelFromJson(
        Map<String, dynamic> json) =>
    _CollectionPromotionModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      sotType: json['sotType'] as String?,
      vendors: (json['vendors'] as List<dynamic>?)
          ?.map((e) => PromotionVendorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionPromotionModelToJson(
        _CollectionPromotionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sotType': instance.sotType,
      'vendors': instance.vendors,
    };
