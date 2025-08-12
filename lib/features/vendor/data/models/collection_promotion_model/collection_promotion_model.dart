import 'package:flutter_ecommerce_app/features/vendor/data/models/promotion_vendor_model/promotion_vendor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_promotion_model.freezed.dart';
part 'collection_promotion_model.g.dart';

@freezed
abstract class CollectionPromotionModel with _$CollectionPromotionModel {
  const factory CollectionPromotionModel({
    int? id,
    String? title,
    String? sotType,
    List<PromotionVendorModel>? vendors,
  }) = _CollectionPromotionModel;

  factory CollectionPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionPromotionModelFromJson(json);
}
