part of 'app_bloc.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
    required Locale locale,
  }) = _AppState;

  factory AppState.initial(
          {required ThemeMode themeMode, required Locale locale}) =>
      AppState(themeMode: themeMode, locale: locale);
      
      
}
