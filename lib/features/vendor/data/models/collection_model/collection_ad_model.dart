import 'package:json_annotation/json_annotation.dart';
part 'collection_ad_model.g.dart';


@JsonSerializable()
class CollectionAdModel {
  final int id;
  @JsonKey(name: 'media')
  final String image;

  CollectionAdModel({
    required this.id,
    required this.image,
  });

  factory CollectionAdModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionAdModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionAdModelToJson(this);
}

