import 'package:json_annotation/json_annotation.dart';

part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  final List<CountryData> data;
  final bool success;

  CountriesModel({
    required this.data,
    required this.success,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}

@JsonSerializable()
class CountryData {
  final int id;
  final String name;
  final String native;

  CountryData({
    required this.id,
    required this.name,
    required this.native,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}