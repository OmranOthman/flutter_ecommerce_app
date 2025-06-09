import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<ApiResult<HomeModel, Failure>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        HomeModel homeModel = await homeRemoteDataSource.fetchHomeData();

        return ApiResult.withSuccess(homeModel);
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
