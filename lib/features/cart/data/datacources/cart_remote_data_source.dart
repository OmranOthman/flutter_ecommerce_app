import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class CartRemoteDataSource {
  Future<List<void>> getCartItems();
  Future<void> toggleItemSelection(String itemId, bool selected);
  Future<void> removeItem(String itemId);
  Future<void> updateItemQuantity(String itemId, int quantity);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<void>> getCartItems() async {
    final response = await dio.get('/cart/items');
    if (response.statusCode == 200) {
      return (response.data['items'] as List);

    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> toggleItemSelection(String itemId, bool selected) async {
    final response = await dio.patch(
      '/cart/items/$itemId/select',
      data: {'selected': selected},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> removeItem(String itemId) async {
    final response = await dio.delete('/cart/items/$itemId');
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    final response = await dio.patch(
      '/cart/items/$itemId/quantity',
      data: {'quantity': quantity},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}