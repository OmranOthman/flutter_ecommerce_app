import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';

import 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  final SettingsRepository settingsRepository;

  AppSettingsCubit({required this.settingsRepository})
      : super(AppSettingsInitial());

  Future<void> fetchAppSettings() async {
    emit(AppSettingsLoading());

    final ApiResult<InfoModel, Failure> result = await settingsRepository.getAppSettings();

    if (result.dataResponse != null) {
      emit(AppSettingsLoaded(result.dataResponse!));
    } else if (result.errorResponse != null) {
      emit(AppSettingsError(_mapFailureToMessage(result.errorResponse!)));
    } else {
      emit(const AppSettingsError("Unknown error occurred"));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is InternetConnectionFailure) {
      return "No internet connection";
    } else if (failure is ServerFailure) {
      return "Server error occurred";
    } else if (failure is DioFailure) {
      return "Network error occurred";
    } else {
      return "Unexpected error occurred";
    }
  }
}
