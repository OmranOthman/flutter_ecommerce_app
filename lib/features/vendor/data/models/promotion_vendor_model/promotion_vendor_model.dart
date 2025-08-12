import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_vendor_model.freezed.dart';
part 'promotion_vendor_model.g.dart';

@freezed
abstract class PromotionVendorModel with _$PromotionVendorModel {
  const factory PromotionVendorModel({
    int? id,
    String? name,
    String? media,
    num? rating,
    String? cuisines,
    @JsonKey(name: 'brand_image') String? brandImage,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    @JsonKey(name: 'is_open') bool? inOpen,
  }) = _PromotionVendorModel;

  factory PromotionVendorModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionVendorModelFromJson(json);
}
