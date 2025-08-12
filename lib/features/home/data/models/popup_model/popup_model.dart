import 'package:freezed_annotation/freezed_annotation.dart';
part 'popup_model.freezed.dart';
part 'popup_model.g.dart';

@freezed
abstract class PopupModel with _$PopupModel {
  const factory PopupModel({
    int? id,
    @JsonKey(name: "ad_id") int? adId,
    @JsonKey(name: "ad_type") dynamic adType,
    @JsonKey(name: "vendor_id") int? vendorId,
    String? url,
    @JsonKey(name: "collection_show_type") dynamic collectionShowType,
    @JsonKey(name: "category_show_type") dynamic categoryShowType,
    String? media,
  }) = _PopupModel;

  factory PopupModel.fromJson(Map<String, dynamic> json) => _$PopupModelFromJson(json);
}