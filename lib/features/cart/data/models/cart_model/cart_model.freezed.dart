// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartModel {
  int? get id;
  dynamic get meta;
  @JsonKey(name: 'cart_lines')
  List<CartLinesModel>? get cartLines;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartModelCopyWith<CartModel> get copyWith =>
      _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality().equals(other.cartLines, cartLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(cartLines));

  @override
  String toString() {
    return 'CartModel(id: $id, meta: $meta, cartLines: $cartLines)';
  }
}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) =
      _$CartModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      dynamic meta,
      @JsonKey(name: 'cart_lines') List<CartLinesModel>? cartLines});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res> implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? meta = freezed,
    Object? cartLines = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cartLines: freezed == cartLines
          ? _self.cartLines
          : cartLines // ignore: cast_nullable_to_non_nullable
              as List<CartLinesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CartModel implements CartModel {
  _CartModel(
      {this.id,
      this.meta,
      @JsonKey(name: 'cart_lines') final List<CartLinesModel>? cartLines})
      : _cartLines = cartLines;
  factory _CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  @override
  final int? id;
  @override
  final dynamic meta;
  final List<CartLinesModel>? _cartLines;
  @override
  @JsonKey(name: 'cart_lines')
  List<CartLinesModel>? get cartLines {
    final value = _cartLines;
    if (value == null) return null;
    if (_cartLines is EqualUnmodifiableListView) return _cartLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartModelCopyWith<_CartModel> get copyWith =>
      __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality()
                .equals(other._cartLines, _cartLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(_cartLines));

  @override
  String toString() {
    return 'CartModel(id: $id, meta: $meta, cartLines: $cartLines)';
  }
}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(
          _CartModel value, $Res Function(_CartModel) _then) =
      __$CartModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      dynamic meta,
      @JsonKey(name: 'cart_lines') List<CartLinesModel>? cartLines});
}

/// @nodoc
class __$CartModelCopyWithImpl<$Res> implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? meta = freezed,
    Object? cartLines = freezed,
  }) {
    return _then(_CartModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cartLines: freezed == cartLines
          ? _self._cartLines
          : cartLines // ignore: cast_nullable_to_non_nullable
              as List<CartLinesModel>?,
    ));
  }
}

// dart format on
