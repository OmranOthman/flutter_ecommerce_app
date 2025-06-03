import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthState.init());

  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    ApiResult<void, Failure> result = await authRepository.login(
        phone: state.phone!, password: state.password!);

    emit(state.copyWith(isLoading: false));
  }

  void saveFirstTimeOpenApp() {
    authRepository.saveFirstTimeOpenApp();
  }

  bool get checkIfFirstTimeOpenApp => authRepository.checkIfFirstTimeOpenApp;

  void phoneOnChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void passwordOnChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void countryCodeChanged(String countryCode) {
    emit(state.copyWith(countryCode: countryCode));
  }

  String _phoneNumberWithCountryCode(String phone) {
    return state.countryCode + (phone[0] == '0' ? phone.substring(1) : phone);
  }
}
