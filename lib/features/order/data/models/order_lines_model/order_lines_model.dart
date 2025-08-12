import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_lines_model.freezed.dart';
part 'order_lines_model.g.dart';
@freezed
abstract class OrderLinesModel with _$OrderLinesModel {
  const factory OrderLinesModel({
    int? id,
    String? name,
    String? media,
    @JsonKey(name: "purchasable_type") String? purchasableType,
    @JsonKey(name: "purchasable_id") int? purchasableId,
    @JsonKey(name: "unit_price") int? unitPrice,
    int? quantity,
    @JsonKey(name: "discount_type") int? discountType,
    @JsonKey(name: "discount_amount") int? discountAmount,
    int? total,
    String? note,
  }) = _OrderLinesModel;

  factory OrderLinesModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLinesModelFromJson(json);
}
