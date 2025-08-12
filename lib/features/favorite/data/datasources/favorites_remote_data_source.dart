import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/models/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritesRemoteDataSource {
  Future<FavoriteModel> getFavorite();
  Future<void> toggleFavorite({
   
    required String type,
    required int id,
  });
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final Dio dio;
  SharedPreferences sharedPreferences;
  FavoritesRemoteDataSourceImpl({
    required this.dio,
    required this.sharedPreferences,
  });
  String? get token => sharedPreferences.getString(AppString.token);
  String? get language => sharedPreferences.getString(AppString.language);


  @override
  Future<FavoriteModel> getFavorite() async {
    Response response = await dio.get(
      "${AppString.apiUrl}favorites",
      options: Options(
        headers: {"Authorization": "Bearer $token", "Accept-Language": language},
      ),
    );
    if (response.statusCode == 200) {
      return FavoriteModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<void> toggleFavorite({
    required String type,
    required int id,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}favorites/toggle/$type/$id",
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
