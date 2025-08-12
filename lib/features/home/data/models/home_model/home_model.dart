import 'package:flutter_ecommerce_app/features/home/data/models/ad_model/ad_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/popup_model/collection_model/collection_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/popup_model/popup_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/promotion_model/promotion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    List<PromotionModel>? promotions,
    List<CollectionModel>? collections,
    List<AdModel>? ads,
    PopupModel? popup,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
}