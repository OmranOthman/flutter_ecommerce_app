import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/datasources/favorites_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/models/favorite_model.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_entity.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRemoteDataSource favoritesRemoteDataSource;
  NetworkInfo networkInfo;


  FavoritesRepositoryImpl({
    required this.favoritesRemoteDataSource,
    required this.networkInfo,
  
  });

  FavoriteModel? _favorite;
  @override
  Future<ApiResult<FavoriteEntity, Failure>> getFavorite() async {
    if (await networkInfo.isConnected) {
      try {
        _favorite = await favoritesRemoteDataSource.getFavorite();
        return ApiResult.withSuccess(_favorite!);
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
  Future<ApiResult<FavoriteEntity, Failure>> toggleFavorite(
      {required int index, required String type, required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        await favoritesRemoteDataSource.toggleFavorite(
      
          type: type,
          id: id,
        );
        if (type == "vendor") {
          _favorite!.vendors!.removeAt(index);
          return ApiResult.withSuccess(_favorite!);
        }
        if (type == "product") {
          _favorite!.products!.removeAt(index);
          return ApiResult.withSuccess(_favorite!);
        }
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
