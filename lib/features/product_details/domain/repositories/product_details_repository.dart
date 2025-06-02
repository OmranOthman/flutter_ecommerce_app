import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

abstract interface class ProductDetailsRepository {
  Future<ApiResult<void, Failure>> getProductDetails(String productId);
  Future<ApiResult<void, Failure>> addToCart({
    required String productId,
    required int quantity,
    required ProductSize size,
  });
}