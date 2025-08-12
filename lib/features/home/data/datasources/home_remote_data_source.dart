import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class HomeRemoteDataSource {
  Future<HomeModel> fetchHomeData();
  Future<void> toggleFavorite({
   
    required int vendorId,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  HomeRemoteDataSourceImpl(
      {required this.sharedPreferences, required this.dio});

  String? get token => sharedPreferences.getString(AppString.token);

  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<HomeModel> fetchHomeData() async {
    Response response = await dio.get(
      "${AppString.apiUrl}home",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    }
    throw (ServerException());
  }

  @override
  Future<void> toggleFavorite({
    required int vendorId,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}favorites/toggle/vendor/$vendorId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }
}
