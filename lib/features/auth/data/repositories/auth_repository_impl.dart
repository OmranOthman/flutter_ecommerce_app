import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({required this.authLocalDataSource});
  @override
  bool get checkIfFirstTimeOpenApp => authLocalDataSource.isFirstTimeOpenApp;

  @override
  Future<void> saveFirstTimeOpenApp() {
    return authLocalDataSource.saveFirstTimeOpenApp();
  }

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> signup({required String fullName, required String email, required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
