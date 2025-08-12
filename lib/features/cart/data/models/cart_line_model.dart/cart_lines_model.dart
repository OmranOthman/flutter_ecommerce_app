import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_lines_model.freezed.dart';
part 'cart_lines_model.g.dart';

@freezed
abstract class CartLinesModel with _$CartLinesModel {
   factory CartLinesModel({
    int? id,
    @JsonKey(name: "purchasable_type") String? purchasableType,
    @JsonKey(name: "purchasable_id") int? purchasableId,
    @JsonKey(name: "vendor_id") int? vendorId,
    @JsonKey(name: "vendor_services") List<dynamic>? vendorServices,
    String? media,
    @JsonKey(name: "price_per_product") int? pricePerProduct,
    @JsonKey(name: "price_before_discount") String? priceBeforeDiscount,
    int? price,
    int? stock,
    String? purchasable,
    @JsonKey(name: "quantity_increment") int? quantityIncrement,
    @JsonKey(name: "min_quantity") int? minQuantity,
    @JsonKey(name: "unit_quantity") int? unitQuantity,
    String? name,
    int? quantity,
    String? note,
    List<dynamic>? meta,
    bool? available,
  }) = _CartLinesModel;

  factory CartLinesModel.fromJson(Map<String, dynamic> json) =>
      _$CartLinesModelFromJson(json);
}


