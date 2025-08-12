part of 'app_bloc.dart';

@freezed
abstract class AppEvent with _$AppEvent {
  const factory AppEvent.changeTheme({required ThemeMode themeMode}) =
      _ChangeTheme;
  const factory AppEvent.changeLanguage({required Locale locale}) =
      _ChangeLanguage;
}
