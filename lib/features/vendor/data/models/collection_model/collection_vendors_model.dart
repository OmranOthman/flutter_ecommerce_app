import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_vendors_model.freezed.dart';
part 'collection_vendors_model.g.dart';



@freezed
abstract class CollectionVendorModel with _$CollectionVendorModel {
  const factory CollectionVendorModel({
    int? id,
    String? name,
    double? rating,
    String? cuisines,
    List<dynamic>? tags,
    @JsonKey(name: 'brand_image') String? brandImage,
    String? media,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    @JsonKey(name: 'is_open') bool? isOpen,
  }) = _CollectionVendorModel;

  factory CollectionVendorModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionVendorModelFromJson(json);
}
