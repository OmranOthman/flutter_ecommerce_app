import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  bool get checkIfFirstTimeOpenApp => authLocalDataSource.isFirstTimeOpenApp;

  @override
  Future<void> saveFirstTimeOpenApp() {
    return authLocalDataSource.saveFirstTimeOpenApp();
  }

  @override
  Future<ApiResult<void, Failure>> login(
      {required String phone, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        String token =
            await authRemoteDataSource.login(phone: phone, password: password);
        await authLocalDataSource.saveToken(token);
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
  Future<void> signup(
      {required String fullName,
      required String email,
      required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
