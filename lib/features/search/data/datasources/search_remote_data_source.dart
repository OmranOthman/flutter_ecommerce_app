import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_model.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<SearchModel>> search({
    int? collectionId,
    String? search,
  });

  Future<List<SearchProductModel>> searchByVendor({
    int? vendorId,
    String? search,
  });
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  SearchRemoteDataSourceImpl({
    required this.dio,
    required this.sharedPreferences,
  });

  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<List<SearchModel>> search({
    int? collectionId,
    String? search,
  }) async {
    Response response = await dio.get("${AppString.apiUrl}search",
        queryParameters: {
          "search": search,
          "collection": collectionId,
        },
        options: Options(headers: {"Accept-Language": language}));

    if (response.statusCode == 200) {
      return (response.data['data'] as List<dynamic>)
          .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SearchProductModel>> searchByVendor({
    int? vendorId,
    String? search,
  }) async {
    Response response = await dio.get("${AppString.apiUrl}search/$vendorId",
        queryParameters: {
          "search": search,
        },
        options: Options(headers: {"Accept-Language": language}));

    if (response.statusCode == 200) {
      return (response.data['data'] as List<dynamic>)
          .map((e) => SearchProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
