import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class SearchRepository {
  Future<ApiResult<List<void>, Failure>> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
  });

  Future<ApiResult<List<void>, Failure>> getSearchSuggestions(String query);

  Future<ApiResult<void, Failure>> saveSearchHistory(String query);

  Future<ApiResult<List<void>, Failure>> getSearchHistory();

  Future<ApiResult<void, Failure>> clearSearchHistory();
}