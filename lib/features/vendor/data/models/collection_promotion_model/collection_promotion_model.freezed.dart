// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_promotion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionPromotionModel {
  int? get id;
  String? get title;
  String? get sotType;
  List<PromotionVendorModel>? get vendors;

  /// Create a copy of CollectionPromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionPromotionModelCopyWith<CollectionPromotionModel> get copyWith =>
      _$CollectionPromotionModelCopyWithImpl<CollectionPromotionModel>(
          this as CollectionPromotionModel, _$identity);

  /// Serializes this CollectionPromotionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CollectionPromotionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sotType, sotType) || other.sotType == sotType) &&
            const DeepCollectionEquality().equals(other.vendors, vendors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, sotType,
      const DeepCollectionEquality().hash(vendors));

  @override
  String toString() {
    return 'CollectionPromotionModel(id: $id, title: $title, sotType: $sotType, vendors: $vendors)';
  }
}

/// @nodoc
abstract mixin class $CollectionPromotionModelCopyWith<$Res> {
  factory $CollectionPromotionModelCopyWith(CollectionPromotionModel value,
          $Res Function(CollectionPromotionModel) _then) =
      _$CollectionPromotionModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? sotType,
      List<PromotionVendorModel>? vendors});
}

/// @nodoc
class _$CollectionPromotionModelCopyWithImpl<$Res>
    implements $CollectionPromotionModelCopyWith<$Res> {
  _$CollectionPromotionModelCopyWithImpl(this._self, this._then);

  final CollectionPromotionModel _self;
  final $Res Function(CollectionPromotionModel) _then;

  /// Create a copy of CollectionPromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? sotType = freezed,
    Object? vendors = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sotType: freezed == sotType
          ? _self.sotType
          : sotType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendors: freezed == vendors
          ? _self.vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<PromotionVendorModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CollectionPromotionModel implements CollectionPromotionModel {
  const _CollectionPromotionModel(
      {this.id,
      this.title,
      this.sotType,
      final List<PromotionVendorModel>? vendors})
      : _vendors = vendors;
  factory _CollectionPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionPromotionModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? sotType;
  final List<PromotionVendorModel>? _vendors;
  @override
  List<PromotionVendorModel>? get vendors {
    final value = _vendors;
    if (value == null) return null;
    if (_vendors is EqualUnmodifiableListView) return _vendors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CollectionPromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionPromotionModelCopyWith<_CollectionPromotionModel> get copyWith =>
      __$CollectionPromotionModelCopyWithImpl<_CollectionPromotionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectionPromotionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CollectionPromotionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sotType, sotType) || other.sotType == sotType) &&
            const DeepCollectionEquality().equals(other._vendors, _vendors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, sotType,
      const DeepCollectionEquality().hash(_vendors));

  @override
  String toString() {
    return 'CollectionPromotionModel(id: $id, title: $title, sotType: $sotType, vendors: $vendors)';
  }
}

/// @nodoc
abstract mixin class _$CollectionPromotionModelCopyWith<$Res>
    implements $CollectionPromotionModelCopyWith<$Res> {
  factory _$CollectionPromotionModelCopyWith(_CollectionPromotionModel value,
          $Res Function(_CollectionPromotionModel) _then) =
      __$CollectionPromotionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? sotType,
      List<PromotionVendorModel>? vendors});
}

/// @nodoc
class __$CollectionPromotionModelCopyWithImpl<$Res>
    implements _$CollectionPromotionModelCopyWith<$Res> {
  __$CollectionPromotionModelCopyWithImpl(this._self, this._then);

  final _CollectionPromotionModel _self;
  final $Res Function(_CollectionPromotionModel) _then;

  /// Create a copy of CollectionPromotionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? sotType = freezed,
    Object? vendors = freezed,
  }) {
    return _then(_CollectionPromotionModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sotType: freezed == sotType
          ? _self.sotType
          : sotType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendors: freezed == vendors
          ? _self._vendors
          : vendors // ignore: cast_nullable_to_non_nullable
              as List<PromotionVendorModel>?,
    ));
  }
}

// dart format on
