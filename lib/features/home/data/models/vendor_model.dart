// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel {
  int? id;
  String? name;
  double? rating;
  String? cuisines;
  @JsonKey(name: "brand_image")
  String? brandImage;
  String? media;
  @JsonKey(name: "is_favorite")
  bool? isFavorite;
  @JsonKey(name: "is_open")
  bool? isOpen;
  VendorModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.cuisines,
    required this.brandImage,
    required this.media,
    required this.isFavorite,
    required this.isOpen,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
