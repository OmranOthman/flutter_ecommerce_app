import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class AuthRepository {
  Future<void> saveFirstTimeOpenApp();
  bool get checkIfFirstTimeOpenApp;
  Future<ApiResult<void, Failure>> login({required String phone, required String password});
  Future<ApiResult<void, Failure>> signup({required String fullName,required String email, required String password});

}
