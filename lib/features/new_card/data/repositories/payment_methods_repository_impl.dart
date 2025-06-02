import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/new_card/data/datasources/payment_methods_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/new_card/data/datasources/payment_methods_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/new_card/domain/repositories/payment_methods_repository.dart';

class PaymentMethodsRepositoryImpl implements PaymentMethodsRepository {
  final PaymentMethodsRemoteDataSource remoteDataSource;
  final PaymentMethodsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PaymentMethodsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<void, Failure>> addNewCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  }) async {
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