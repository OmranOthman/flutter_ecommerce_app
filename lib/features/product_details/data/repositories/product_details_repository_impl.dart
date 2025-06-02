import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/product_details/data/datasources/product_details_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/product_details/data/datasources/product_details_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsLocalDataSource localDataSource;
  final ProductDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductDetailsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<void, Failure>> getProductDetails(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource.getProductDetails(productId);
        return ApiResult.withSuccess(product);
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
  Future<ApiResult<void, Failure>> addToCart({
    required String productId,
    required int quantity,
    required ProductSize size,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addToCart(
          productId: productId,
          quantity: quantity,
          size: size,
        );
        return ApiResult.withSuccess(null);
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