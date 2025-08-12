import 'package:freezed_annotation/freezed_annotation.dart';
part 'vendor_model.freezed.dart';
part 'vendor_model.g.dart';

@freezed
abstract class VendorModel with _$VendorModel {
   factory VendorModel({
    int? id,
    String? name,
    double? rating,
    String? cuisines,
    @JsonKey(name: 'brand_image') String? brandImage,
    String? media,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    @JsonKey(name: 'is_open') @Default(false) bool isOpen,
  }) = _VendorModel;

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);
}
