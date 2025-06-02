import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class OrdersRepository {
  Future<ApiResult<List<void>, Failure>> getActiveOrders();
  Future<ApiResult<List<void>, Failure>> getOrderHistory();
  Future<ApiResult<void, Failure>> getOrderDetails(String orderId);
  Future<ApiResult<void, Failure>> getOrderTracking(String orderId);
  Future<ApiResult<void, Failure>> markOrderAsDelivered(String orderId);
}