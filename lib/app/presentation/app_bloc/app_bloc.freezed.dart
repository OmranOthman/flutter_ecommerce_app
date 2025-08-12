// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppEvent()';
  }
}

/// @nodoc
class $AppEventCopyWith<$Res> {
  $AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}

/// @nodoc

class _ChangeTheme implements AppEvent {
  const _ChangeTheme({required this.themeMode});

  final ThemeMode themeMode;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeThemeCopyWith<_ChangeTheme> get copyWith =>
      __$ChangeThemeCopyWithImpl<_ChangeTheme>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTheme &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @override
  String toString() {
    return 'AppEvent.changeTheme(themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class _$ChangeThemeCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$ChangeThemeCopyWith(
          _ChangeTheme value, $Res Function(_ChangeTheme) _then) =
      __$ChangeThemeCopyWithImpl;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$ChangeThemeCopyWithImpl<$Res> implements _$ChangeThemeCopyWith<$Res> {
  __$ChangeThemeCopyWithImpl(this._self, this._then);

  final _ChangeTheme _self;
  final $Res Function(_ChangeTheme) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_ChangeTheme(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _ChangeLanguage implements AppEvent {
  const _ChangeLanguage({required this.locale});

  final Locale locale;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith =>
      __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeLanguage &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @override
  String toString() {
    return 'AppEvent.changeLanguage(locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(
          _ChangeLanguage value, $Res Function(_ChangeLanguage) _then) =
      __$ChangeLanguageCopyWithImpl;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = null,
  }) {
    return _then(_ChangeLanguage(
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

// dart format on
