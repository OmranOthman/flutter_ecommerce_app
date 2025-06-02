import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<void>> searchProducts({
    required String query,
    int page,
    int limit,
  });

  Future<List<String>> getSearchSuggestions(String query);
}


class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<void>> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await dio.get('/search/products', queryParameters: {
        'query': query,
        'page': page,
        'limit': limit,
      });

      if (response.statusCode == 200) {
        return (response.data['results'] as List);
            // .map((json) => ProductItemModel.fromJson(json))
            // .toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getSearchSuggestions(String query) async {
    try {
      final response = await dio.get('/search/suggestions', queryParameters: {
        'query': query,
      });

      if (response.statusCode == 200) {
        return (response.data['suggestions'] as List).cast<String>();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}