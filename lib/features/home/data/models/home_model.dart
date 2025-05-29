import 'package:flutter_ecommerce_app/features/home/data/models/promotion_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  List<PromotionModel>? promotions;
  HomeModel({
    required this.promotions,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
