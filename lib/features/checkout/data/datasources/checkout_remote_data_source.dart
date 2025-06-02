import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class CheckoutRemoteDataSource {
  Future<void> getCheckoutContent();
  Future<void> setShippingAddress(String addressId);
  Future<void> setPaymentMethod(String cardId);
  Future<void> placeOrder();
}
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final Dio dio;

  CheckoutRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> getCheckoutContent() async {
    final response = await dio.get('/checkout/content');
    if (response.statusCode == 200) {
     // return CheckoutContent.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> setShippingAddress(String addressId) async {
    final response = await dio.post(
      '/checkout/shipping',
      data: {'address_id': addressId},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> setPaymentMethod(String cardId) async {
    final response = await dio.post(
      '/checkout/payment',
      data: {'card_id': cardId},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> placeOrder() async {
    final response = await dio.post('/checkout/place-order');
    if (response.statusCode == 200) {
     // return OrderConfirmation.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}