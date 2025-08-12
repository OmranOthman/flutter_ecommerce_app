import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.freezed.dart';
part 'product_details_model.g.dart';

@freezed
abstract class ProductDetailsModel with _$ProductDetailsModel {
  factory ProductDetailsModel({
    int? id,
    @JsonKey(name: 'vendor_id') int? vendorId,
    @JsonKey(name: 'variant_id') int? variantId,
    String? name,
    String? description,
    String? sku,
    @JsonKey(name: 'min_quantity') int? minQuantity,
    @JsonKey(name: 'quantity_increment') int? quantityIncrement,
    @JsonKey(name: 'backorder_quantity') int? backorderQuantity,
    int? stock,
    String? purchasable,
    @JsonKey(name: 'price_before_discount') dynamic priceBeforeDiscount,
    num? price,
    List<dynamic>? addons,
    List<dynamic>? tags,
    List<String>? media,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    bool? bogo,
    List<String>? sizes,
  }) = _ProductDetailsModel;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}
