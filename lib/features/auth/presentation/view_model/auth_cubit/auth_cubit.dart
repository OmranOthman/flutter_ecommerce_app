import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/entities/register_entity.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthState.init());

  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    ApiResult<void, Failure> result = await authRepository.login(
        phone: _phoneNumberWithCountryCode(state.phone!),
        password: state.password!);

    if (result.errorResponse != null) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(result.errorResponse!)));
    } else {
      emit(state.copyWith(
        isLoading: false,
        loginSuccessfully: true,
      ));
    }
  }

  void phoneOnChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void passwordOnChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void phoneCodeChanged(String phoneCode) {
    emit(state.copyWith(phoneCode: phoneCode));
  }

  String _phoneNumberWithCountryCode(String phone) {
    return state.phoneCode + (phone[0] == '0' ? phone.substring(1) : phone);
  }

  ///register
  Future<void> register() async {
    emit(state.copyWith(isLoading: true));

    ApiResult<void, Failure> result = await authRepository.register(
        registerEntity: state.registerEntity!.copyWith(
            phone: _phoneNumberWithCountryCode(state.registerEntity!.phone!)));

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        registerSuccessfully: true,
      ));
    }
  }

  void nameOnChanged(String fullName) {
    emit(state.copyWith(
        registerEntity: state.registerEntity!.copyWith(name: fullName)));
  }

  void phoneRegisterOnChanged(String phone) {
    emit(state.copyWith(
        registerEntity: state.registerEntity!.copyWith(phone: phone)));
  }

  void phoneCodeRegisterOnChanged(String phoneCode) {
    emit(state.copyWith(
        registerEntity: state.registerEntity!.copyWith(phoneCode: phoneCode)));
  }

  void passwordRegisterOnChanged(String passwordRegister) {
    emit(state.copyWith(
        registerEntity:
            state.registerEntity!.copyWith(password: passwordRegister)));
  }

  void passwordConfirmationRegisterOnChanged(String passwordConfirmation) {
    emit(state.copyWith(
        registerEntity: state.registerEntity!
            .copyWith(passwordConfirmation: passwordConfirmation)));
  }

  void countryCodeRegisterChanged(String countryCode) {
    emit(state.copyWith(
        registerEntity:
            state.registerEntity!.copyWith(countryCode: countryCode)));
  }

 




 

}
