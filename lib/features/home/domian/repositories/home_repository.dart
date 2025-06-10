import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model.dart';

abstract interface class HomeRepository {
  Future<ApiResult<HomeModel, Failure>> getHomeData();
}
