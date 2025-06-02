import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/cart/data/datacources/cart_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/cart/data/datacources/cart_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<List<void>, Failure>> getCartItems() async {
    if (await networkInfo.isConnected) {
      try {
        final items = await remoteDataSource.getCartItems();
        await localDataSource.cacheCartItems(items);
        return ApiResult.withSuccess(items);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    } else {
      final cachedItems = localDataSource.getCachedCartItems();
      return ApiResult.withSuccess(cachedItems);
    }
  }

  @override
  Future<ApiResult<void, Failure>> toggleItemSelection(String itemId, bool selected) async {
    if (await networkInfo.isConnected) {
      try {
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
  Future<ApiResult<void, Failure>> removeItem(String itemId) async {
    if (await networkInfo.isConnected) {
      try {
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
  Future<ApiResult<void, Failure>> updateItemQuantity(String itemId, int quantity) async {
    if (await networkInfo.isConnected) {
      try {
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
  Future<ApiResult<double, Failure>> getSubtotal() async {
    if (await networkInfo.isConnected) {
      try {
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