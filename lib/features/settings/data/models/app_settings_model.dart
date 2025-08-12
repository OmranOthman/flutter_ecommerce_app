import 'package:json_annotation/json_annotation.dart';

part 'app_settings_model.g.dart';

@JsonSerializable()
class AppSettingsModel {
  final AppSettingsData data;

  AppSettingsModel({required this.data});

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsModelToJson(this);
}

@JsonSerializable()
class AppSettingsData {
  final String? location;
  final String? email;
  final String? phone;
  final String? address;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? linkedin;
  final String? youtube;
  final String? terms;
  final String? splash;
  final String currency;

  AppSettingsData({
    this.location,
    this.email,
    this.phone,
    this.address,
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.youtube,
    this.terms,
    this.splash,
    required this.currency,
  });

  factory AppSettingsData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsDataToJson(this);
}