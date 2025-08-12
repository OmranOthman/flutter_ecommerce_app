import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_review_model/order_review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class OrdersRemoteDataSource {
  Future<List<OrderModel>> fetchOnGoingOrders();
  Future<List<OrderModel>> fetchCompletedOrder();
  Future<OrderModel> fetchOrderDetails(int orderId);
  Future<void> pay({required int orderId, required int paymentMethod});
  Future<List<OrderReviewModel>> fetchOrderReviews(int orderId);
  Future<void> addOrderReview({
    required int orderId,
    required int rating,
    required String review,
  });
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  OrdersRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.dio,
  });
  String? get token => sharedPreferences.getString(AppString.token);
  String? get language => sharedPreferences.getString(AppString.language);


  @override
  Future<List<OrderModel>> fetchOnGoingOrders() async {
    Response response = await dio.get(
      "${AppString.apiUrl}orders/ongoing",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map(
            (json) => OrderModel.fromJson(json),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderModel>> fetchCompletedOrder() async {
    Response response = await dio.get(
      "${AppString.apiUrl}orders/completed",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map(
            (json) => OrderModel.fromJson(json),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OrderModel> fetchOrderDetails(int orderId) async {
    Response response = await dio.get(
      '${AppString.apiUrl}orders/$orderId',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return OrderModel.fromJson(response.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> pay({required int orderId, required int paymentMethod}) async {
    Response response = await dio.post('${AppString.apiUrl}pay/$orderId',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept-Language": language
          },
        ),
        data: {"method": paymentMethod});
    if (response.statusCode == 200) {
      if (!response.data['success']) {
        throw DioException;
      } else {
        throw ServerException();
      }
    }
    return;
  }

  @override
  Future<List<OrderReviewModel>> fetchOrderReviews(int orderId) async {
    final response = await dio.get(
      '${AppString.apiUrl}order-reviews/$orderId',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );

    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((json) => OrderReviewModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addOrderReview({
    required int orderId,
    required int rating,
    required String review,
  }) async {
    final response = await dio.post(
      '${AppString.apiUrl}review-order/$orderId',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: {
        'rating': rating,
        'review': review,
      },
    );

    if (response.statusCode != 200 || !(response.data['success'] ?? false)) {
      throw ServerException();
    }
  }

}
