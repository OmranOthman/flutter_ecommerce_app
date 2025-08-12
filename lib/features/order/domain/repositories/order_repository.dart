import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_review_model/order_review_model.dart';

abstract interface class OrdersRepository {
  Future<ApiResult<List<OrderModel>, Failure>> getOnGoingOrders();
  Future<ApiResult<List<OrderModel>, Failure>> getCompletedOrder();
  Future<ApiResult<OrderModel, Failure>> getOrderDetails(int orderId);
  Future<ApiResult<OrderModel, Failure>> pay({
    required int orderId,
    required int paymentMethod,
  });
  Future<ApiResult<List<OrderReviewModel>, Failure>> getOrderReviews(int orderId);
  Future<ApiResult<void, Failure>> addOrderReview({
    required int orderId,
    required int rating,
    required String review,
  });
}
