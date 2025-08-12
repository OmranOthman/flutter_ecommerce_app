// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_vendors_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionVendorModel {
  int? get id;
  String? get name;
  double? get rating;
  String? get cuisines;
  List<dynamic>? get tags;
  @JsonKey(name: 'brand_image')
  String? get brandImage;
  String? get media;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @JsonKey(name: 'is_open')
  bool? get isOpen;

  /// Create a copy of CollectionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionVendorModelCopyWith<CollectionVendorModel> get copyWith =>
      _$CollectionVendorModelCopyWithImpl<CollectionVendorModel>(
          this as CollectionVendorModel, _$identity);

  /// Serializes this CollectionVendorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CollectionVendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      rating,
      cuisines,
      const DeepCollectionEquality().hash(tags),
      brandImage,
      media,
      isFavorite,
      isOpen);

  @override
  String toString() {
    return 'CollectionVendorModel(id: $id, name: $name, rating: $rating, cuisines: $cuisines, tags: $tags, brandImage: $brandImage, media: $media, isFavorite: $isFavorite, isOpen: $isOpen)';
  }
}

/// @nodoc
abstract mixin class $CollectionVendorModelCopyWith<$Res> {
  factory $CollectionVendorModelCopyWith(CollectionVendorModel value,
          $Res Function(CollectionVendorModel) _then) =
      _$CollectionVendorModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? rating,
      String? cuisines,
      List<dynamic>? tags,
      @JsonKey(name: 'brand_image') String? brandImage,
      String? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool? isOpen});
}

/// @nodoc
class _$CollectionVendorModelCopyWithImpl<$Res>
    implements $CollectionVendorModelCopyWith<$Res> {
  _$CollectionVendorModelCopyWithImpl(this._self, this._then);

  final CollectionVendorModel _self;
  final $Res Function(CollectionVendorModel) _then;

  /// Create a copy of CollectionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? tags = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? isOpen = freezed,
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
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      cuisines: freezed == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CollectionVendorModel implements CollectionVendorModel {
  const _CollectionVendorModel(
      {this.id,
      this.name,
      this.rating,
      this.cuisines,
      final List<dynamic>? tags,
      @JsonKey(name: 'brand_image') this.brandImage,
      this.media,
      @JsonKey(name: 'is_favorite') this.isFavorite,
      @JsonKey(name: 'is_open') this.isOpen})
      : _tags = tags;
  factory _CollectionVendorModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionVendorModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? rating;
  @override
  final String? cuisines;
  final List<dynamic>? _tags;
  @override
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'brand_image')
  final String? brandImage;
  @override
  final String? media;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @override
  @JsonKey(name: 'is_open')
  final bool? isOpen;

  /// Create a copy of CollectionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionVendorModelCopyWith<_CollectionVendorModel> get copyWith =>
      __$CollectionVendorModelCopyWithImpl<_CollectionVendorModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectionVendorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CollectionVendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      rating,
      cuisines,
      const DeepCollectionEquality().hash(_tags),
      brandImage,
      media,
      isFavorite,
      isOpen);

  @override
  String toString() {
    return 'CollectionVendorModel(id: $id, name: $name, rating: $rating, cuisines: $cuisines, tags: $tags, brandImage: $brandImage, media: $media, isFavorite: $isFavorite, isOpen: $isOpen)';
  }
}

/// @nodoc
abstract mixin class _$CollectionVendorModelCopyWith<$Res>
    implements $CollectionVendorModelCopyWith<$Res> {
  factory _$CollectionVendorModelCopyWith(_CollectionVendorModel value,
          $Res Function(_CollectionVendorModel) _then) =
      __$CollectionVendorModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? rating,
      String? cuisines,
      List<dynamic>? tags,
      @JsonKey(name: 'brand_image') String? brandImage,
      String? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool? isOpen});
}

/// @nodoc
class __$CollectionVendorModelCopyWithImpl<$Res>
    implements _$CollectionVendorModelCopyWith<$Res> {
  __$CollectionVendorModelCopyWithImpl(this._self, this._then);

  final _CollectionVendorModel _self;
  final $Res Function(_CollectionVendorModel) _then;

  /// Create a copy of CollectionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? tags = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_CollectionVendorModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      cuisines: freezed == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
