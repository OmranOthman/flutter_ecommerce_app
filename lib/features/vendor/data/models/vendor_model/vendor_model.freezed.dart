// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorModel {
  int? get id;
  String? get name;
  double? get rating;
  String? get cuisines;
  @JsonKey(name: 'brand_image')
  String? get brandImage;
  String? get media;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @JsonKey(name: 'is_open')
  bool get isOpen;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VendorModelCopyWith<VendorModel> get copyWith =>
      _$VendorModelCopyWithImpl<VendorModel>(this as VendorModel, _$identity);

  /// Serializes this VendorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rating, cuisines,
      brandImage, media, isFavorite, isOpen);

  @override
  String toString() {
    return 'VendorModel(id: $id, name: $name, rating: $rating, cuisines: $cuisines, brandImage: $brandImage, media: $media, isFavorite: $isFavorite, isOpen: $isOpen)';
  }
}

/// @nodoc
abstract mixin class $VendorModelCopyWith<$Res> {
  factory $VendorModelCopyWith(
          VendorModel value, $Res Function(VendorModel) _then) =
      _$VendorModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? rating,
      String? cuisines,
      @JsonKey(name: 'brand_image') String? brandImage,
      String? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool isOpen});
}

/// @nodoc
class _$VendorModelCopyWithImpl<$Res> implements $VendorModelCopyWith<$Res> {
  _$VendorModelCopyWithImpl(this._self, this._then);

  final VendorModel _self;
  final $Res Function(VendorModel) _then;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? isOpen = null,
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
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VendorModel implements VendorModel {
  _VendorModel(
      {this.id,
      this.name,
      this.rating,
      this.cuisines,
      @JsonKey(name: 'brand_image') this.brandImage,
      this.media,
      @JsonKey(name: 'is_favorite') this.isFavorite,
      @JsonKey(name: 'is_open') this.isOpen = false});
  factory _VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? rating;
  @override
  final String? cuisines;
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
  final bool isOpen;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VendorModelCopyWith<_VendorModel> get copyWith =>
      __$VendorModelCopyWithImpl<_VendorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VendorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rating, cuisines,
      brandImage, media, isFavorite, isOpen);

  @override
  String toString() {
    return 'VendorModel(id: $id, name: $name, rating: $rating, cuisines: $cuisines, brandImage: $brandImage, media: $media, isFavorite: $isFavorite, isOpen: $isOpen)';
  }
}

/// @nodoc
abstract mixin class _$VendorModelCopyWith<$Res>
    implements $VendorModelCopyWith<$Res> {
  factory _$VendorModelCopyWith(
          _VendorModel value, $Res Function(_VendorModel) _then) =
      __$VendorModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      double? rating,
      String? cuisines,
      @JsonKey(name: 'brand_image') String? brandImage,
      String? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool isOpen});
}

/// @nodoc
class __$VendorModelCopyWithImpl<$Res> implements _$VendorModelCopyWith<$Res> {
  __$VendorModelCopyWithImpl(this._self, this._then);

  final _VendorModel _self;
  final $Res Function(_VendorModel) _then;

  /// Create a copy of VendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? isOpen = null,
  }) {
    return _then(_VendorModel(
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
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
