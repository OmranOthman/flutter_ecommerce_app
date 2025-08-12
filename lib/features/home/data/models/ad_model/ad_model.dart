import 'package:freezed_annotation/freezed_annotation.dart';
part 'ad_model.freezed.dart';
part 'ad_model.g.dart';

@freezed
abstract class AdModel with _$AdModel {
  const factory AdModel({
    dynamic id,
    @JsonKey(name: "ad_id") dynamic adId,
    @JsonKey(name: "ad_type") dynamic adType,
    @JsonKey(name: "vendor_id") dynamic vendorId,
    dynamic url,
    @JsonKey(name: "collection_show_type") dynamic collectionShowType,
    @JsonKey(name: "category_show_type") dynamic categoryShowType,
    dynamic media,
  }) = _AdModel;

  factory AdModel.fromJson(Map<String, dynamic> json) => _$AdModelFromJson(json);
}