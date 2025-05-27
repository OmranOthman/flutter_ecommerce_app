import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/app_router.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_ecommerce_app/app/domain/repositories/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepository appRepository;
  AppBloc({required this.appRepository})
      : super(
          AppState.initial(
            themeMode: appRepository.getThemeMode,
            locale: appRepository.getLanguage,
          ),
        ) {
    on<_ChangeTheme>((event, emit) async {
      AppRouter.navigator.pushNamed(RoutePath.languageChangingPageRoute);

      await appRepository.changeThemeMode(event.themeMode);
      emit(state.copyWith(themeMode: event.themeMode));
    });
    on<_ChangeLanguage>((event, emit) async {
      AppRouter.navigator.pushNamed(RoutePath.languageChangingPageRoute);
      await appRepository.changeLanguage(event.locale);

      emit(state.copyWith(locale: event.locale));
    });
  }
}
