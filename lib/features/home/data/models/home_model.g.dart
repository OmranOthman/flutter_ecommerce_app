// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      promotions: (json['promotions'] as List<dynamic>?)
          ?.map((e) => PromotionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      collections: (json['collections'] as List<dynamic>?)
          ?.map((e) => CollectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ads: (json['ads'] as List<dynamic>?)
          ?.map((e) => AdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      popup: json['popup'] == null
          ? null
          : PopupModel.fromJson(json['popup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'promotions': instance.promotions,
      'collections': instance.collections,
      'ads': instance.ads,
      'popup': instance.popup,
    };
