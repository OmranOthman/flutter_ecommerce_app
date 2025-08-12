import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_model/vendor_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'promotion_model.freezed.dart';
part 'promotion_model.g.dart';

@freezed
abstract class PromotionModel with _$PromotionModel  {
  const factory PromotionModel({
    int? id,
    String? sotType,
    List<VendorModel>? vendors,
    String? title,
  }) = _PromotionModel;

  factory PromotionModel.fromJson(Map<String, dynamic> json) => _$PromotionModelFromJson(json);
}