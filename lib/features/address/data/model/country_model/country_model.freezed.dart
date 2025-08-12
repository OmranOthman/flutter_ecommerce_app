// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryModel {
  int? get id;
  String? get name;
  @JsonKey(name: 'native')
  String? get nativeName;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<CountryModel> get copyWith =>
      _$CountryModelCopyWithImpl<CountryModel>(
          this as CountryModel, _$identity);

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nativeName, nativeName) ||
                other.nativeName == nativeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nativeName);

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, nativeName: $nativeName)';
  }
}

/// @nodoc
abstract mixin class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) _then) =
      _$CountryModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id, String? name, @JsonKey(name: 'native') String? nativeName});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res> implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._self, this._then);

  final CountryModel _self;
  final $Res Function(CountryModel) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nativeName = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nativeName: freezed == nativeName
          ? _self.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CountryModel implements CountryModel {
  const _CountryModel(
      {this.id, this.name, @JsonKey(name: 'native') this.nativeName});
  factory _CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'native')
  final String? nativeName;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryModelCopyWith<_CountryModel> get copyWith =>
      __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nativeName, nativeName) ||
                other.nativeName == nativeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nativeName);

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, nativeName: $nativeName)';
  }
}

/// @nodoc
abstract mixin class _$CountryModelCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(
          _CountryModel value, $Res Function(_CountryModel) _then) =
      __$CountryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id, String? name, @JsonKey(name: 'native') String? nativeName});
}

/// @nodoc
class __$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(this._self, this._then);

  final _CountryModel _self;
  final $Res Function(_CountryModel) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nativeName = freezed,
  }) {
    return _then(_CountryModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nativeName: freezed == nativeName
          ? _self.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
