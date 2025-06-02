import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/datasources/favorites_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/datasources/favorites_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
   FavoritesRemoteDataSource favoritesRemoteDataSource;
   FavoritesLocalDataSource favoritesLocalDataSource;
  NetworkInfo networkInfo;

  FavoritesRepositoryImpl({
    required this.favoritesRemoteDataSource,
    required this.favoritesLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<void, Failure>> getFavoriteProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResult = await favoritesRemoteDataSource.getFavoriteProducts();

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
  Future<void> addFavorite(String productId) async {

  }

  @override
  Future<void> removeFavorite(String productId) async {

  }
}