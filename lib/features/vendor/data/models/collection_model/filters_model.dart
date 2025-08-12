import 'package:json_annotation/json_annotation.dart';

part 'filters_model.g.dart';

@JsonSerializable()
class FiltersModel {
  final List<Cuisine> cuisines;
  final List<dynamic> tags;

  FiltersModel({
    required this.cuisines,
    required this.tags,
  });

  factory FiltersModel.fromJson(Map<String, dynamic> json) =>
      _$FiltersModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersModelToJson(this);
}

@JsonSerializable()
class Cuisine {
  final int id;
  final String name;

  Cuisine({
    required this.id,
    required this.name,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  Map<String, dynamic> toJson() => _$CuisineToJson(this);
}