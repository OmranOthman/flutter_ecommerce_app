import 'package:flutter_ecommerce_app/features/cart/domain/entities/cart_total_entity.dart';

class CartTotalModel extends CartTotalEntity {
  CartTotalModel({
    super.count,
    super.total,
    super.vendor,
  });

  CartTotalModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    vendor = json['vendor'];
  }
}
