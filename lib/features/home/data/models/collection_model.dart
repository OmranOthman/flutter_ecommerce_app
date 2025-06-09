import 'package:json_annotation/json_annotation.dart';
part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  final int? id;
  final String? title;
  final dynamic showType;
  final dynamic column;
  final dynamic tag;
  final String? media;

  CollectionModel({
    this.id,
    this.title,
    this.showType,
    this.column,
    this.tag,
    this.media,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
