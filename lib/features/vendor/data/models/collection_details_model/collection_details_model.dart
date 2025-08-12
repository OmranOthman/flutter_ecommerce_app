import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_ad_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_promotion_model/collection_promotion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_details_model.freezed.dart';
part 'collection_details_model.g.dart';

@freezed
abstract class CollectionDetailsModel with _$CollectionDetailsModel {
  const factory CollectionDetailsModel({
    String? collection,
    List<dynamic>? services,
    List<SubCollectionItemModel>? subCollection,
    List<CollectionAdModel>? ads,
    List<CollectionPromotionModel>? promotions,
    dynamic popup,
  }) = _CollectionDetailsModel;

  factory CollectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsModelFromJson(json);
}

@freezed
abstract class SubCollectionItemModel with _$SubCollectionItemModel {
  const factory SubCollectionItemModel({
    int? id,
    String? title,
    String? media,
  }) = _SubCollectionItemModel;

  factory SubCollectionItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubCollectionItemModelFromJson(json);
}
