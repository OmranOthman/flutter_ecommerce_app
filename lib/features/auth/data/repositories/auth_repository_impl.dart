import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  @override
  bool get checkIfFirstTimeOpenApp => authLocalDataSource.isFirstTimeOpenApp;

  @override
  Future<void> saveFirstTimeOpenApp() {
    return authLocalDataSource.saveFirstTimeOpenApp();
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      String token =
          await authRemoteDataSource.login(email: email, password: password);
      await authLocalDataSource.saveToken(token);

    } on ServerException {
    } on DioException catch (error) {
    } catch (e) {}
  }

  @override
  Future<void> signup(
      {required String fullName,
      required String email,
      required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
