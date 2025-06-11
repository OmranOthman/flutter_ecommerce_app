part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;
  final int stateNum;
  const AppState({
    required this.locale,
    required this.themeMode,
    required this.stateNum,
  });

  factory AppState.initial(
          {required ThemeMode themeMode, required Locale locale}) =>
      AppState(themeMode: themeMode, locale: locale, stateNum: 0);

  AppState copyWith({ThemeMode? themeMode, Locale? locale, int? stateNum}) {
    return AppState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
        stateNum: stateNum ?? this.stateNum);
  }

  @override
  List<Object?> get props => [
        locale,
        themeMode,
        stateNum,
      ];
}
