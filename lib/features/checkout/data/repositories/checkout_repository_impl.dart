import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/checkout/data/datasources/checkout_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/checkout/data/datasources/checkout_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/checkout/domain/repositories/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutLocalDataSource localDataSource;
  final CheckoutRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CheckoutRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<void, Failure>> getCheckoutContent() async {
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
  Future<ApiResult<void, Failure>> setShippingAddress(String addressId) async {
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
  Future<ApiResult<void, Failure>> setPaymentMethod(String cardId) async {
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
  Future<ApiResult<void, Failure>> placeOrder() async {
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