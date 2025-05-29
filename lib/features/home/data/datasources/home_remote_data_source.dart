import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<HomeModel> fetchHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  //fetch data with dio
  @override
  Future<HomeModel> fetchHomeData() async {
    Response response = await dio.get(
      "${AppString.apiUrl}home",
    );
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    }
    throw (ServerException());
  }
}
