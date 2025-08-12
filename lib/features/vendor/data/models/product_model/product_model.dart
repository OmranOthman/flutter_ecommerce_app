import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
   factory ProductModel({
     int? id,
    @JsonKey(name: 'variant_id')  int? variantId,
     String? name,
     String? description,
    @JsonKey(name: 'category_id')  int? categoryId,
     String? media,
    @JsonKey(name: 'price_before_discount') double? priceBeforeDiscount,
     double? price,
     int? stock,
    @JsonKey(name: 'quantity_increment')  int? quantityIncrement,
     String? purchasable,
     int? backorder,
    @JsonKey(name: 'min_quantity')  int? minQuantity,
    @JsonKey(name: 'has_addon')  bool? hasAddon,
     bool? bogo,
    @JsonKey(name: 'is_favorite')  bool? isFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
