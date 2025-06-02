import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class CartRepository {
  Future<ApiResult<List<void>, Failure>> getCartItems();
  Future<ApiResult<void, Failure>> toggleItemSelection(String itemId, bool selected);
  Future<ApiResult<void, Failure>> getSubtotal();
  Future<ApiResult<void, Failure>> removeItem(String itemId);
  Future<ApiResult<void, Failure>> updateItemQuantity(String itemId, int quantity);
}