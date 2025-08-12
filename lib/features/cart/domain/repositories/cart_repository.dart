import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/entities/cart_total_entity.dart';

abstract interface class CartRepository {
  Future<ApiResult<List<CartModel>, Failure>> getCartItems();
  Future<ApiResult<CartTotalEntity, Failure>> getCartTotal();

 
  Future<ApiResult<List<CartModel>, Failure>> deleteCart();
  Future<ApiResult<List<CartModel>, Failure>> deleteCartLine({
    required int cartId,
    required int cartLineId,
  });
  Future<ApiResult<void, Failure>> updateNote({
    required int cartLineId,
    required String note,
  });
  Future<ApiResult<void, Failure>> incrementProductCart({
    required int cartId,
    required int cartLineId,
    required int quantity,
  });

  Future<ApiResult<void, Failure>> createOrder({
    required int addressId,
    required String schedule,
    required int method,
    String? note,
  });
}
