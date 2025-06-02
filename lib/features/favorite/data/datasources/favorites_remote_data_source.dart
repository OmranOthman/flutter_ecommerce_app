import 'package:dio/dio.dart';


abstract class FavoritesRemoteDataSource {
  Future<void> getFavoriteProducts();
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
}



class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final Dio dio;

  FavoritesRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<void> addFavorite(String productId) async {
    try {
      final response = await dio.post(
        '/favorites/add',
        data: {'product_id': productId},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add favorite: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to add favorite: ${e.message}');
    }
  }

  @override
  Future<void> removeFavorite(String productId) async {
    try {
      final response = await dio.delete(
        '/favorites/remove',
        data: {'product_id': productId},
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to remove favorite: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to remove favorite: ${e.message}');
    }
  }


}