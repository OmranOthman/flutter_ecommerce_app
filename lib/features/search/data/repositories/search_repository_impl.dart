import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalDataSource localDataSource;
  final SearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<List<void>, Failure>> searchProducts({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final results = await remoteDataSource.searchProducts(
          query: query,
          page: page,
          limit: limit,
        );
        return ApiResult.withSuccess(results);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<void>, Failure>> getSearchSuggestions(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final suggestions = await remoteDataSource.getSearchSuggestions(query);
        return ApiResult.withSuccess(suggestions);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> saveSearchHistory(String query) async {
    try {
      await localDataSource.saveSearchQuery(query);
      return ApiResult.withSuccess(null);
    } catch (error) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<List<void>, Failure>> getSearchHistory() async {
    try {
      final history = await localDataSource.getSearchHistory();
      return ApiResult.withSuccess(history);
    } catch (error) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<void, Failure>> clearSearchHistory() async {
    try {
      await localDataSource.clearSearchHistory();
      return ApiResult.withSuccess(null);
    } catch (error) {
      return ApiResult.withError(UnknowFailure());
    }
  }
}