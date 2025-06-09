import 'package:flutter_ecommerce_app/features/home/data/models/ad_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/collection_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/popup_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/promotion_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  List<PromotionModel>? promotions;
  List<CollectionModel>? collections;
  List<AdModel>? ads;
  final PopupModel? popup;

  HomeModel({
    this.promotions,
    this.collections,
    this.ads,
    this.popup,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
