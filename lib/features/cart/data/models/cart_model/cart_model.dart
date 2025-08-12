import 'package:flutter_ecommerce_app/features/cart/data/models/cart_line_model.dart/cart_lines_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
   factory CartModel({
    int? id,
    dynamic meta,
    @JsonKey(name: 'cart_lines') List<CartLinesModel>? cartLines,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
}