import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vendor_details_model.freezed.dart';
part 'vendor_details_model.g.dart';

@freezed
abstract class VendorDetailsModel with _$VendorDetailsModel {
  const factory VendorDetailsModel({
     int? id,
     String? name,
     String? description,
    @JsonKey(name: 'legal_name')  String? legalName,
     String? phone,
    @JsonKey(name: 'payment_methods')  List<String>? paymentMethods,
    @JsonKey(name: 'min_order')  int? minOrder,
     List<dynamic>? discounts,
     String? collection,
     Map<String, dynamic>? location,
     List<dynamic>? services,
    @JsonKey(name: 'categories_show_type')  String? categoriesShowType,
    @JsonKey(name: 'products_show_type')  String? productsShowType,
     List<String>? cuisines,
    @JsonKey(name: 'is_open')  bool? isOpen,
    @JsonKey(name: 'opening_hours_today')
     List<dynamic>? openingHoursToday,
    @JsonKey(name: 'brand_image')  String? brandImage,
     List<String>? media,
     List<CategoryModel>? categories,
     List<dynamic>? tags,
    @JsonKey(name: 'is_favorite')  bool? isFavorite,
  }) = _VendorDetailsModel;

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsModelFromJson(json);
}
