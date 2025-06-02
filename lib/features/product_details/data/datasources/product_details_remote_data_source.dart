import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';



abstract interface class ProductDetailsRemoteDataSource {
  Future<void> getProductDetails(String productId);
  Future<void> addToCart({
    required String productId,
    required int quantity,
    required ProductSize size,
  });
}

class ProductDetailsRemoteDataSourceImpl implements ProductDetailsRemoteDataSource {
  final Dio dio;

  ProductDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> getProductDetails(String productId) async {
    try {
      final response = await dio.get('/products/$productId');
      if (response.statusCode == 200) {
       // return ProductItemModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<void> addToCart({
    required String productId,
    required int quantity,
    required ProductSize size,
  }) async {
    try {
      final response = await dio.post('/cart', data: {
        'product_id': productId,
        'quantity': quantity,
        'size': size.name,
      });

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}