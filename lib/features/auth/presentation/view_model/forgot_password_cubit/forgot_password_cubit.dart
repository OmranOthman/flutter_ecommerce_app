import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  AuthRepository authRepository;

  ForgotPasswordCubit({required this.authRepository}) : super(ForgotPasswordState.init());

  Future<void> forgetPassword({required String phone,required String phoneCode}) async {
    emit(state.copyWith(isLoadingForgotPassword: true));
    ApiResult<void, Failure> result = await authRepository.forgetPassword(
        fullPhone:phoneCode + _phoneNumberWithCountryCode(phoneCode:phoneCode ,phone:phone)
    );
    if (result.errorResponse != null) {
      emit(state.copyWith(
          isLoadingForgotPassword: false,
          errorMessageForgotPassword: failureHandlingMessage(result.errorResponse!)));
    } else {
      emit(state.copyWith(
        isLoadingForgotPassword: false,
        sendCodeSuccessfully: true,
      ));
    }
  }

  String _phoneNumberWithCountryCode({required String phoneCode,required String phone}) {
    return phoneCode + (phone[0] == '0' ? phone.substring(1) : phone);
  }
}
