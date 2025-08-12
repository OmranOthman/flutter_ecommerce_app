import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model/home_model.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });

  HomeModel? _homeModel;
  @override
  Future<ApiResult<HomeModel, Failure>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        _homeModel = await homeRemoteDataSource.fetchHomeData();

        return ApiResult.withSuccess(_homeModel!);
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
  Future<ApiResult<HomeModel, Failure>> toggleFavorite({
    required int vendorId,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await homeRemoteDataSource.toggleFavorite(vendorId: vendorId);
      final promotions = _homeModel?.promotions ?? [];

      final updatedPromotions = promotions.map((promotion) {
        final vendors = promotion.vendors ?? [];

        final updatedVendors = vendors.map((vendor) {
          if (vendor.id == vendorId) {
            return vendor.copyWith(isFavorite: !(vendor.isFavorite ?? false));
          }
          return vendor;
        }).toList();

        return promotion.copyWith(vendors: updatedVendors);
      }).toList();

      _homeModel = _homeModel?.copyWith(promotions: updatedPromotions);

      return ApiResult.withSuccess(_homeModel!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }
}
