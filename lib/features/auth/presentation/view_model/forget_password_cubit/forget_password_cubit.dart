import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepository authRepository;
  ForgetPasswordCubit({required this.authRepository})
      : super(ForgetPasswordState.initial());

  Future<void> changePassword(
      {required String fullPhone, required String token}) async {
    emit(state.copyWith(isLoading: true));
    ApiResult<void, Failure> result = await authRepository.resetPassword(
        fullPhone: fullPhone,
        token: token,
        password: state.password!,
        passwordConfirmation: state.passwordConfirmation!);

    if (result.errorResponse != null) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(result.errorResponse!)));
    } else {
      emit(state.copyWith(
        isLoading: false,
        changePasswordSuccess: true,
      ));
    }
  }

  void passwordConfirmationOnChanged(String passwordConfirmation) {
    emit(state.copyWith(passwordConfirmation: passwordConfirmation));
  }

  void passwordOnChanged(String password) {
    emit(state.copyWith(password: password));
  }
}
