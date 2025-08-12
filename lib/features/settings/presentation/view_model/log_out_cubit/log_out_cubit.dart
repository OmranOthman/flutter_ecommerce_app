import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  SettingsRepository settingsRepository;
  LogOutCubit({
    required this.settingsRepository,
  }) : super(LogOutState.init());

  Future<void> logOut() async {
    emit(state.copyWith(isLoading: true));
    ApiResult<void, Failure> result = await settingsRepository.logout();

    if (result.errorResponse != null) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(result.errorResponse!),
        ),
      );
    } else {
      emit(
        state.copyWith(
          successMessage: "logout_success",
          isLoading: false,
        ),
      );
    }
  }
}
