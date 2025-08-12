// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_vendor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionVendorModel {
  int? get id;
  String? get name;
  String? get media;
  num? get rating;
  String? get cuisines;
  @JsonKey(name: 'brand_image')
  String? get brandImage;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @JsonKey(name: 'is_open')
  bool? get inOpen;

  /// Create a copy of PromotionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionVendorModelCopyWith<PromotionVendorModel> get copyWith =>
      _$PromotionVendorModelCopyWithImpl<PromotionVendorModel>(
          this as PromotionVendorModel, _$identity);

  /// Serializes this PromotionVendorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionVendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.inOpen, inOpen) || other.inOpen == inOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, media, rating,
      cuisines, brandImage, isFavorite, inOpen);

  @override
  String toString() {
    return 'PromotionVendorModel(id: $id, name: $name, media: $media, rating: $rating, cuisines: $cuisines, brandImage: $brandImage, isFavorite: $isFavorite, inOpen: $inOpen)';
  }
}

/// @nodoc
abstract mixin class $PromotionVendorModelCopyWith<$Res> {
  factory $PromotionVendorModelCopyWith(PromotionVendorModel value,
          $Res Function(PromotionVendorModel) _then) =
      _$PromotionVendorModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? media,
      num? rating,
      String? cuisines,
      @JsonKey(name: 'brand_image') String? brandImage,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool? inOpen});
}

/// @nodoc
class _$PromotionVendorModelCopyWithImpl<$Res>
    implements $PromotionVendorModelCopyWith<$Res> {
  _$PromotionVendorModelCopyWithImpl(this._self, this._then);

  final PromotionVendorModel _self;
  final $Res Function(PromotionVendorModel) _then;

  /// Create a copy of PromotionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? media = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? brandImage = freezed,
    Object? isFavorite = freezed,
    Object? inOpen = freezed,
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
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      cuisines: freezed == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as String?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      inOpen: freezed == inOpen
          ? _self.inOpen
          : inOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionVendorModel implements PromotionVendorModel {
  const _PromotionVendorModel(
      {this.id,
      this.name,
      this.media,
      this.rating,
      this.cuisines,
      @JsonKey(name: 'brand_image') this.brandImage,
      @JsonKey(name: 'is_favorite') this.isFavorite,
      @JsonKey(name: 'is_open') this.inOpen});
  factory _PromotionVendorModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionVendorModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? media;
  @override
  final num? rating;
  @override
  final String? cuisines;
  @override
  @JsonKey(name: 'brand_image')
  final String? brandImage;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @override
  @JsonKey(name: 'is_open')
  final bool? inOpen;

  /// Create a copy of PromotionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionVendorModelCopyWith<_PromotionVendorModel> get copyWith =>
      __$PromotionVendorModelCopyWithImpl<_PromotionVendorModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionVendorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionVendorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.cuisines, cuisines) ||
                other.cuisines == cuisines) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.inOpen, inOpen) || other.inOpen == inOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, media, rating,
      cuisines, brandImage, isFavorite, inOpen);

  @override
  String toString() {
    return 'PromotionVendorModel(id: $id, name: $name, media: $media, rating: $rating, cuisines: $cuisines, brandImage: $brandImage, isFavorite: $isFavorite, inOpen: $inOpen)';
  }
}

/// @nodoc
abstract mixin class _$PromotionVendorModelCopyWith<$Res>
    implements $PromotionVendorModelCopyWith<$Res> {
  factory _$PromotionVendorModelCopyWith(_PromotionVendorModel value,
          $Res Function(_PromotionVendorModel) _then) =
      __$PromotionVendorModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? media,
      num? rating,
      String? cuisines,
      @JsonKey(name: 'brand_image') String? brandImage,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      @JsonKey(name: 'is_open') bool? inOpen});
}

/// @nodoc
class __$PromotionVendorModelCopyWithImpl<$Res>
    implements _$PromotionVendorModelCopyWith<$Res> {
  __$PromotionVendorModelCopyWithImpl(this._self, this._then);

  final _PromotionVendorModel _self;
  final $Res Function(_PromotionVendorModel) _then;

  /// Create a copy of PromotionVendorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? media = freezed,
    Object? rating = freezed,
    Object? cuisines = freezed,
    Object? brandImage = freezed,
    Object? isFavorite = freezed,
    Object? inOpen = freezed,
  }) {
    return _then(_PromotionVendorModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      cuisines: freezed == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as String?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      inOpen: freezed == inOpen
          ? _self.inOpen
          : inOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
