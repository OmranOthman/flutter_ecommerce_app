// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdModel {
  dynamic get id;
  @JsonKey(name: "ad_id")
  dynamic get adId;
  @JsonKey(name: "ad_type")
  dynamic get adType;
  @JsonKey(name: "vendor_id")
  dynamic get vendorId;
  dynamic get url;
  @JsonKey(name: "collection_show_type")
  dynamic get collectionShowType;
  @JsonKey(name: "category_show_type")
  dynamic get categoryShowType;
  dynamic get media;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdModelCopyWith<AdModel> get copyWith =>
      _$AdModelCopyWithImpl<AdModel>(this as AdModel, _$identity);

  /// Serializes this AdModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.adId, adId) &&
            const DeepCollectionEquality().equals(other.adType, adType) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.collectionShowType, collectionShowType) &&
            const DeepCollectionEquality()
                .equals(other.categoryShowType, categoryShowType) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(adId),
      const DeepCollectionEquality().hash(adType),
      const DeepCollectionEquality().hash(vendorId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(collectionShowType),
      const DeepCollectionEquality().hash(categoryShowType),
      const DeepCollectionEquality().hash(media));

  @override
  String toString() {
    return 'AdModel(id: $id, adId: $adId, adType: $adType, vendorId: $vendorId, url: $url, collectionShowType: $collectionShowType, categoryShowType: $categoryShowType, media: $media)';
  }
}

/// @nodoc
abstract mixin class $AdModelCopyWith<$Res> {
  factory $AdModelCopyWith(AdModel value, $Res Function(AdModel) _then) =
      _$AdModelCopyWithImpl;
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: "ad_id") dynamic adId,
      @JsonKey(name: "ad_type") dynamic adType,
      @JsonKey(name: "vendor_id") dynamic vendorId,
      dynamic url,
      @JsonKey(name: "collection_show_type") dynamic collectionShowType,
      @JsonKey(name: "category_show_type") dynamic categoryShowType,
      dynamic media});
}

/// @nodoc
class _$AdModelCopyWithImpl<$Res> implements $AdModelCopyWith<$Res> {
  _$AdModelCopyWithImpl(this._self, this._then);

  final AdModel _self;
  final $Res Function(AdModel) _then;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? adId = freezed,
    Object? adType = freezed,
    Object? vendorId = freezed,
    Object? url = freezed,
    Object? collectionShowType = freezed,
    Object? categoryShowType = freezed,
    Object? media = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adType: freezed == adType
          ? _self.adType
          : adType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectionShowType: freezed == collectionShowType
          ? _self.collectionShowType
          : collectionShowType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryShowType: freezed == categoryShowType
          ? _self.categoryShowType
          : categoryShowType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AdModel implements AdModel {
  const _AdModel(
      {this.id,
      @JsonKey(name: "ad_id") this.adId,
      @JsonKey(name: "ad_type") this.adType,
      @JsonKey(name: "vendor_id") this.vendorId,
      this.url,
      @JsonKey(name: "collection_show_type") this.collectionShowType,
      @JsonKey(name: "category_show_type") this.categoryShowType,
      this.media});
  factory _AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);

  @override
  final dynamic id;
  @override
  @JsonKey(name: "ad_id")
  final dynamic adId;
  @override
  @JsonKey(name: "ad_type")
  final dynamic adType;
  @override
  @JsonKey(name: "vendor_id")
  final dynamic vendorId;
  @override
  final dynamic url;
  @override
  @JsonKey(name: "collection_show_type")
  final dynamic collectionShowType;
  @override
  @JsonKey(name: "category_show_type")
  final dynamic categoryShowType;
  @override
  final dynamic media;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdModelCopyWith<_AdModel> get copyWith =>
      __$AdModelCopyWithImpl<_AdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.adId, adId) &&
            const DeepCollectionEquality().equals(other.adType, adType) &&
            const DeepCollectionEquality().equals(other.vendorId, vendorId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.collectionShowType, collectionShowType) &&
            const DeepCollectionEquality()
                .equals(other.categoryShowType, categoryShowType) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(adId),
      const DeepCollectionEquality().hash(adType),
      const DeepCollectionEquality().hash(vendorId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(collectionShowType),
      const DeepCollectionEquality().hash(categoryShowType),
      const DeepCollectionEquality().hash(media));

  @override
  String toString() {
    return 'AdModel(id: $id, adId: $adId, adType: $adType, vendorId: $vendorId, url: $url, collectionShowType: $collectionShowType, categoryShowType: $categoryShowType, media: $media)';
  }
}

/// @nodoc
abstract mixin class _$AdModelCopyWith<$Res> implements $AdModelCopyWith<$Res> {
  factory _$AdModelCopyWith(_AdModel value, $Res Function(_AdModel) _then) =
      __$AdModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: "ad_id") dynamic adId,
      @JsonKey(name: "ad_type") dynamic adType,
      @JsonKey(name: "vendor_id") dynamic vendorId,
      dynamic url,
      @JsonKey(name: "collection_show_type") dynamic collectionShowType,
      @JsonKey(name: "category_show_type") dynamic categoryShowType,
      dynamic media});
}

/// @nodoc
class __$AdModelCopyWithImpl<$Res> implements _$AdModelCopyWith<$Res> {
  __$AdModelCopyWithImpl(this._self, this._then);

  final _AdModel _self;
  final $Res Function(_AdModel) _then;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? adId = freezed,
    Object? adType = freezed,
    Object? vendorId = freezed,
    Object? url = freezed,
    Object? collectionShowType = freezed,
    Object? categoryShowType = freezed,
    Object? media = freezed,
  }) {
    return _then(_AdModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      adType: freezed == adType
          ? _self.adType
          : adType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectionShowType: freezed == collectionShowType
          ? _self.collectionShowType
          : collectionShowType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryShowType: freezed == categoryShowType
          ? _self.categoryShowType
          : categoryShowType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
