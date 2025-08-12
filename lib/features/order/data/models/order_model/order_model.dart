import 'package:flutter_ecommerce_app/features/order/data/models/order_lines_model/order_lines_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    int? id,
    String? status,
    @JsonKey(name: "status_value") int? statusValue,
    @JsonKey(name: "vendor_name") String? vendorName,
    @JsonKey(name: "vendor_brand_image") String? vendorBrandImage,
    int? total,
    String? note,
    String? address,
    int? fee,
     int? subtotal,
    @JsonKey(name: "discount_total") int? discountTotal,
    @JsonKey(name: "expected_prep_time") dynamic expectedPrepTime,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "order_lines") List<OrderLinesModel>? orderLines,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
