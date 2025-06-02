import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class OrdersRemoteDataSource {
  Future<List<void>> getActiveOrders();
  Future<List<void>> getOrderHistory();
  Future<void> getOrderDetails(String orderId);
  Future<void> getOrderTracking(String orderId);
  Future<void> markOrderAsDelivered(String orderId);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio dio;

  OrdersRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<void>> getActiveOrders() async {
    final response = await dio.get('/orders/active');
    if (response.statusCode == 200) {
      return (response.data['orders'] as List);
          // .map((json) => Order.fromJson(json))
          // .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<void>> getOrderHistory() async {
    final response = await dio.get('/orders/history');
    if (response.statusCode == 200) {
      return (response.data['orders'] as List);
          // .map((json) => Order.fromJson(json))
          // .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> getOrderDetails(String orderId) async {
    final response = await dio.get('/orders/$orderId/details');
    if (response.statusCode == 200) {
     // return OrderDetails.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> getOrderTracking(String orderId) async {
    final response = await dio.get('/orders/$orderId/tracking');
    if (response.statusCode == 200) {
      //return OrderTracking.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> markOrderAsDelivered(String orderId) async {
    final response = await dio.post('/orders/$orderId/mark-delivered');
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}