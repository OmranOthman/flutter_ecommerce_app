// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {
  int? get id;
  String? get title;
  String? get media;
  List<dynamic>? get children;
  List<ProductModel>? get products;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      _$CategoryModelCopyWithImpl<CategoryModel>(
          this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      media,
      const DeepCollectionEquality().hash(children),
      const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, media: $media, children: $children, products: $products)';
  }
}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) _then) =
      _$CategoryModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? media,
      List<dynamic>? children,
      List<ProductModel>? products});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? children = freezed,
    Object? products = freezed,
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
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      products: freezed == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryModel implements CategoryModel {
  _CategoryModel(
      {this.id,
      this.title,
      this.media,
      final List<dynamic>? children,
      final List<ProductModel>? products})
      : _children = children,
        _products = products;
  factory _CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? media;
  final List<dynamic>? _children;
  @override
  List<dynamic>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _products;
  @override
  List<ProductModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      media,
      const DeepCollectionEquality().hash(_children),
      const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, media: $media, children: $children, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) _then) =
      __$CategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? media,
      List<dynamic>? children,
      List<ProductModel>? products});
}

/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? children = freezed,
    Object? products = freezed,
  }) {
    return _then(_CategoryModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      products: freezed == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

// dart format on
