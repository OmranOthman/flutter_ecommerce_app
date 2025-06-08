import 'package:json_annotation/json_annotation.dart';

part 'ad_model.g.dart';

@JsonSerializable()
class AdModel {
  final dynamic id;
  @JsonKey(name: "ad_id")
  final dynamic adId;
  @JsonKey(name: "ad_type")
  final dynamic adType;
  @JsonKey(name: "vendor_id")
  final dynamic vendorId;
  final dynamic url;
  @JsonKey(name: "collection_show_type")
  final dynamic collectionShowType;
  @JsonKey(name: "category_show_type")
  final dynamic categoryShowType;
  final dynamic media;

  AdModel({
    this.id,
    this.adId,
    this.adType,
    this.vendorId,
    this.url,
    this.collectionShowType,
    this.categoryShowType,
    this.media,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel();
}
