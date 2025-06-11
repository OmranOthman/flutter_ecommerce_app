import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  AuthRepository authRepository;
  VerificationCubit({
    required this.authRepository,
  }) : super(VerificationState.init());

  Future<void> phoneVerify(String fullPhone) async {
    emit(state.copyWith(isLoading: true));

    ApiResult<void, Failure> result =
        await authRepository.phoneVerify(fullPhone: fullPhone, otp: state.otp!);

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        phoneVerifySuccessfully: true,
      ));
    }
  }

  Future<void> resendCode(String fullPhone) async {
    ApiResult<String, Failure> result = await authRepository.resendCode(
      fullPhone: fullPhone,
    );

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        verifyMessage: result.dataResponse,
        resendCodeSuccessfully: true,
      ));
      _startTimer();
    }
  }

  void onCodeChanged(String otp) {
    emit(state.copyWith(otp: otp));
  }

  void _startTimer() {
    emit(state.copyWith(second: 30));

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (state.second == 0) {
        timer.cancel();
      } else {
        emit(state.copyWith(second: state.second - 1));
      }
    });
  }
}
