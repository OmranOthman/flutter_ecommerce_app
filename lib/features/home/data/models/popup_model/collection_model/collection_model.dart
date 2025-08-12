import 'package:freezed_annotation/freezed_annotation.dart';
part 'collection_model.freezed.dart';
part 'collection_model.g.dart';

@freezed
abstract class CollectionModel with _$CollectionModel {
  const factory CollectionModel({
    int? id,
    String? title,
    dynamic showType,
    dynamic column,
    dynamic tag,
    String? media,
  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);
}