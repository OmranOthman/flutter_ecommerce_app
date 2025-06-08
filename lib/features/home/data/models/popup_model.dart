import 'package:json_annotation/json_annotation.dart';
part 'popup_model.g.dart';


@JsonSerializable()
class PopupModel{
  final int? id;
  @JsonKey(name: "ad_id")
  final int? adId;
  @JsonKey(name: "ad_type")
  final dynamic adType;
  @JsonKey(name: "vendor_id")
  final int? vendorId;
  final String? url;
  @JsonKey(name: "collection_show_type")
  final dynamic collectionShowType;
  @JsonKey(name: "category_show_type")
  final dynamic categoryShowType;
  final String? media;

  PopupModel({
    this.id,
    this.adId,
    this.adType,
    this.vendorId,
    this.url,
    this.collectionShowType,
    this.categoryShowType,
    this.media,
  });

  factory PopupModel.fromJson(Map<String, dynamic> json) => _$PopupModelFromJson(json);
}