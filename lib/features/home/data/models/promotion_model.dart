import 'package:flutter_ecommerce_app/features/home/data/models/vendor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promotion_model.g.dart';

@JsonSerializable()
class PromotionModel {
  int? id;
  String? title;
  String? sotType;
  List<VendorModel>? vendors;
  PromotionModel({this.id, this.sotType, this.vendors, this.title});
  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionModelToJson(this);
}
