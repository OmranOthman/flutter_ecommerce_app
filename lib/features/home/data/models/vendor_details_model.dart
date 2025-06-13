import 'package:json_annotation/json_annotation.dart';

part 'vendor_details_model.g.dart';

@JsonSerializable()
class VendorDetailsModel {
  final Data data;

  VendorDetailsModel({required this.data});

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDetailsModelToJson(this);
}

@JsonSerializable()
class Data {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'legal_name')
  final String legalName;
  final String phone;
  @JsonKey(name: 'payment_methods')
  final List<String> paymentMethods;
  @JsonKey(name: 'min_order')
  final int minOrder;
  final List<dynamic> discounts;
  final String collection;
  final dynamic location;
  final List<dynamic> services;
  @JsonKey(name: 'categories_show_type')
  final String categoriesShowType;
  @JsonKey(name: 'products_show_type')
  final String productsShowType;
  final List<String> cuisines;
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @JsonKey(name: 'opening_hours_today')
  final List<dynamic> openingHoursToday;
  @JsonKey(name: 'brand_image')
  final String brandImage;
  final List<String> media;
  final List<dynamic> categories;
  final List<dynamic> tags;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.legalName,
    required this.phone,
    required this.paymentMethods,
    required this.minOrder,
    required this.discounts,
    required this.collection,
    required this.location,
    required this.services,
    required this.categoriesShowType,
    required this.productsShowType,
    required this.cuisines,
    required this.isOpen,
    required this.openingHoursToday,
    required this.brandImage,
    required this.media,
    required this.categories,
    required this.tags,
    required this.isFavorite,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}