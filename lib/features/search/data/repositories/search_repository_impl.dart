import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_model.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';
import 'package:flutter_ecommerce_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<List<SearchModel>, Failure>> search({
    int? collectionId,
    String? search,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        List<SearchModel> searchModel = await searchRemoteDataSource.search(
          search: search,
          collectionId: collectionId,
        );
        return ApiResult.withSuccess(searchModel);
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
  Future<ApiResult<List<SearchProductModel>, Failure>> searchByVendor({
    int? vendorId,
    String? search,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        List<SearchProductModel> products =
            await searchRemoteDataSource.searchByVendor(
          search: search,
          vendorId: vendorId,
        );
        return ApiResult.withSuccess(products);
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
}
