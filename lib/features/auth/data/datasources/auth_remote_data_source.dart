import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> login({required String phone, required String password});

  Future<void> signup(
      {required String fullName,
      required String email,
      required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dio});

  Dio dio;

  @override
  Future<String> login(
      {required String phone, required String password}) async {
    Response result =
        await dio.post("", data: {"full_phone": phone, "password": password});
    if (result.statusCode == 200) {
      String token = result.data["token"];
      return token;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> signup(
      {required String fullName,
      required String email,
      required String password}) async {}
}
