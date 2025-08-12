import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoModel {
  final InfoData data;

  InfoModel({required this.data});

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}

@JsonSerializable()
class InfoData {
  final Location location;
  final String email;
  final String phone;
  final String address;
  final String facebook;
  final String instagram;
  final String twitter;
  final String linkedin;
  final String youtube;
  final Terms terms;
  final Splash splash;
  final String currency;

  InfoData({
    required this.location,
    required this.email,
    required this.phone,
    required this.address,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.linkedin,
    required this.youtube,
    required this.terms,
    required this.splash,
    required this.currency,
  });

  factory InfoData.fromJson(Map<String, dynamic> json) =>
      _$InfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDataToJson(this);
}

@JsonSerializable()
class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Terms {
  final String en;
  final String ar;

  Terms({required this.en, required this.ar});

  factory Terms.fromJson(Map<String, dynamic> json) =>
      _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Splash {
  final int id;
  @JsonKey(name: 'ad_id')
  final int adId;
  @JsonKey(name: 'ad_type')
  final String adType;
  @JsonKey(name: 'vendor_id')
  final int? vendorId;
  final String? url;
  @JsonKey(name: 'collection_show_type')
  final String? collectionShowType;
  @JsonKey(name: 'category_show_type')
  final String? categoryShowType;
  final String media;

  Splash({
    required this.id,
    required this.adId,
    required this.adType,
    this.vendorId,
    this.url,
    this.collectionShowType,
    this.categoryShowType,
    required this.media,
  });

  factory Splash.fromJson(Map<String, dynamic> json) =>
      _$SplashFromJson(json);

  Map<String, dynamic> toJson() => _$SplashToJson(this);
}
