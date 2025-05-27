part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;
  const AppState({required this.locale, required this.themeMode});

  factory AppState.initial(
          {required ThemeMode themeMode, required Locale locale}) =>
      AppState(themeMode: themeMode, locale: locale);

  AppState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        themeMode,
      ];
}
