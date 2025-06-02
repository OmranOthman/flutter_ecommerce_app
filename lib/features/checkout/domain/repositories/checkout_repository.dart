import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class CheckoutRepository {
  Future<ApiResult<void, Failure>> getCheckoutContent();
  Future<ApiResult<void, Failure>> setShippingAddress(String addressId);
  Future<ApiResult<void, Failure>> setPaymentMethod(String cardId);
  Future<ApiResult<void, Failure>> placeOrder();
}