import 'package:flutter_ecommerce_app/features/home/data/models/vendor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_model.g.dart';

@JsonSerializable()
class PromotionModel {
  int? id;
  String? sotType;
  List<VendorModel>? vendors;
  PromotionModel({
    required this.id,
    required this.sotType,
    required this.vendors,
  });
  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
}
