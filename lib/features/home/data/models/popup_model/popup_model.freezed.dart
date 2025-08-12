// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PopupModel {
  int? get id;
  @JsonKey(name: "ad_id")
  int? get adId;
  @JsonKey(name: "ad_type")
  dynamic get adType;
  @JsonKey(name: "vendor_id")
  int? get vendorId;
  String? get url;
  @JsonKey(name: "collection_show_type")
  dynamic get collectionShowType;
  @JsonKey(name: "category_show_type")
  dynamic get categoryShowType;
  String? get media;

  /// Create a copy of PopupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopupModelCopyWith<PopupModel> get copyWith =>
      _$PopupModelCopyWithImpl<PopupModel>(this as PopupModel, _$identity);

  /// Serializes this PopupModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adId, adId) || other.adId == adId) &&
            const DeepCollectionEquality().equals(other.adType, adType) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other.collectionShowType, collectionShowType) &&
            const DeepCollectionEquality()
                .equals(other.categoryShowType, categoryShowType) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      adId,
      const DeepCollectionEquality().hash(adType),
      vendorId,
      url,
      const DeepCollectionEquality().hash(collectionShowType),
      const DeepCollectionEquality().hash(categoryShowType),
      media);

  @override
  String toString() {
    return 'PopupModel(id: $id, adId: $adId, adType: $adType, vendorId: $vendorId, url: $url, collectionShowType: $collectionShowType, categoryShowType: $categoryShowType, media: $media)';
  }
}

/// @nodoc
abstract mixin class $PopupModelCopyWith<$Res> {
  factory $PopupModelCopyWith(
          PopupModel value, $Res Function(PopupModel) _then) =
      _$PopupModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "ad_id") int? adId,
      @JsonKey(name: "ad_type") dynamic adType,
      @JsonKey(name: "vendor_id") int? vendorId,
      String? url,
      @JsonKey(name: "collection_show_type") dynamic collectionShowType,
      @JsonKey(name: "category_show_type") dynamic categoryShowType,
      String? media});
}

/// @nodoc
class _$PopupModelCopyWithImpl<$Res> implements $PopupModelCopyWith<$Res> {
  _$PopupModelCopyWithImpl(this._self, this._then);

  final PopupModel _self;
  final $Res Function(PopupModel) _then;

  /// Create a copy of PopupModel
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
              as int?,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      adType: freezed == adType
          ? _self.adType
          : adType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PopupModel implements PopupModel {
  const _PopupModel(
      {this.id,
      @JsonKey(name: "ad_id") this.adId,
      @JsonKey(name: "ad_type") this.adType,
      @JsonKey(name: "vendor_id") this.vendorId,
      this.url,
      @JsonKey(name: "collection_show_type") this.collectionShowType,
      @JsonKey(name: "category_show_type") this.categoryShowType,
      this.media});
  factory _PopupModel.fromJson(Map<String, dynamic> json) =>
      _$PopupModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "ad_id")
  final int? adId;
  @override
  @JsonKey(name: "ad_type")
  final dynamic adType;
  @override
  @JsonKey(name: "vendor_id")
  final int? vendorId;
  @override
  final String? url;
  @override
  @JsonKey(name: "collection_show_type")
  final dynamic collectionShowType;
  @override
  @JsonKey(name: "category_show_type")
  final dynamic categoryShowType;
  @override
  final String? media;

  /// Create a copy of PopupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PopupModelCopyWith<_PopupModel> get copyWith =>
      __$PopupModelCopyWithImpl<_PopupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PopupModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PopupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adId, adId) || other.adId == adId) &&
            const DeepCollectionEquality().equals(other.adType, adType) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other.collectionShowType, collectionShowType) &&
            const DeepCollectionEquality()
                .equals(other.categoryShowType, categoryShowType) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      adId,
      const DeepCollectionEquality().hash(adType),
      vendorId,
      url,
      const DeepCollectionEquality().hash(collectionShowType),
      const DeepCollectionEquality().hash(categoryShowType),
      media);

  @override
  String toString() {
    return 'PopupModel(id: $id, adId: $adId, adType: $adType, vendorId: $vendorId, url: $url, collectionShowType: $collectionShowType, categoryShowType: $categoryShowType, media: $media)';
  }
}

/// @nodoc
abstract mixin class _$PopupModelCopyWith<$Res>
    implements $PopupModelCopyWith<$Res> {
  factory _$PopupModelCopyWith(
          _PopupModel value, $Res Function(_PopupModel) _then) =
      __$PopupModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "ad_id") int? adId,
      @JsonKey(name: "ad_type") dynamic adType,
      @JsonKey(name: "vendor_id") int? vendorId,
      String? url,
      @JsonKey(name: "collection_show_type") dynamic collectionShowType,
      @JsonKey(name: "category_show_type") dynamic categoryShowType,
      String? media});
}

/// @nodoc
class __$PopupModelCopyWithImpl<$Res> implements _$PopupModelCopyWith<$Res> {
  __$PopupModelCopyWithImpl(this._self, this._then);

  final _PopupModel _self;
  final $Res Function(_PopupModel) _then;

  /// Create a copy of PopupModel
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
    return _then(_PopupModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      adType: freezed == adType
          ? _self.adType
          : adType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
    ));
  }
}

// dart format on
