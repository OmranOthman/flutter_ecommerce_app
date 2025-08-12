// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionModel {
  int? get id;
  String? get sotType;
  List<VendorModel>? get vendors;
  String? get title;

  /// Create a copy of PromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionModelCopyWith<PromotionModel> get copyWith =>
      _$PromotionModelCopyWithImpl<PromotionModel>(
          this as PromotionModel, _$identity);

  /// Serializes this PromotionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sotType, sotType) || other.sotType == sotType) &&
            const DeepCollectionEquality().equals(other.vendors, vendors) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sotType,
      const DeepCollectionEquality().hash(vendors), title);

  @override
  String toString() {
    return 'PromotionModel(id: $id, sotType: $sotType, vendors: $vendors, title: $title)';
  }
}

/// @nodoc
abstract mixin class $PromotionModelCopyWith<$Res> {
  factory $PromotionModelCopyWith(
          PromotionModel value, $Res Function(PromotionModel) _then) =
      _$PromotionModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id, String? sotType, List<VendorModel>? vendors, String? title});
}

/// @nodoc
class _$PromotionModelCopyWithImpl<$Res>
    implements $PromotionModelCopyWith<$Res> {
  _$PromotionModelCopyWithImpl(this._self, this._then);

  final PromotionModel _self;
  final $Res Function(PromotionModel) _then;

  /// Create a copy of PromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sotType = freezed,
    Object? vendors = freezed,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sotType: freezed == sotType
          ? _self.sotType
          : sotType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendors: freezed == vendors
          ? _self.vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<VendorModel>?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionModel implements PromotionModel {
  const _PromotionModel(
      {this.id, this.sotType, final List<VendorModel>? vendors, this.title})
      : _vendors = vendors;
  factory _PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);

  @override
  final int? id;
  @override
  final String? sotType;
  final List<VendorModel>? _vendors;
  @override
  List<VendorModel>? get vendors {
    final value = _vendors;
    if (value == null) return null;
    if (_vendors is EqualUnmodifiableListView) return _vendors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? title;

  /// Create a copy of PromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionModelCopyWith<_PromotionModel> get copyWith =>
      __$PromotionModelCopyWithImpl<_PromotionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sotType, sotType) || other.sotType == sotType) &&
            const DeepCollectionEquality().equals(other._vendors, _vendors) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sotType,
      const DeepCollectionEquality().hash(_vendors), title);

  @override
  String toString() {
    return 'PromotionModel(id: $id, sotType: $sotType, vendors: $vendors, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$PromotionModelCopyWith<$Res>
    implements $PromotionModelCopyWith<$Res> {
  factory _$PromotionModelCopyWith(
          _PromotionModel value, $Res Function(_PromotionModel) _then) =
      __$PromotionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id, String? sotType, List<VendorModel>? vendors, String? title});
}

/// @nodoc
class __$PromotionModelCopyWithImpl<$Res>
    implements _$PromotionModelCopyWith<$Res> {
  __$PromotionModelCopyWithImpl(this._self, this._then);

  final _PromotionModel _self;
  final $Res Function(_PromotionModel) _then;

  /// Create a copy of PromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? sotType = freezed,
    Object? vendors = freezed,
    Object? title = freezed,
  }) {
    return _then(_PromotionModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sotType: freezed == sotType
          ? _self.sotType
          : sotType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendors: freezed == vendors
          ? _self._vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<VendorModel>?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
