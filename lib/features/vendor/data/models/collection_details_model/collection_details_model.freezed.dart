// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionDetailsModel {
  String? get collection;
  List<dynamic>? get services;
  List<SubCollectionItemModel>? get subCollection;
  List<CollectionAdModel>? get ads;
  List<CollectionPromotionModel>? get promotions;
  dynamic get popup;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionDetailsModelCopyWith<CollectionDetailsModel> get copyWith =>
      _$CollectionDetailsModelCopyWithImpl<CollectionDetailsModel>(
          this as CollectionDetailsModel, _$identity);

  /// Serializes this CollectionDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CollectionDetailsModel &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            const DeepCollectionEquality()
                .equals(other.subCollection, subCollection) &&
            const DeepCollectionEquality().equals(other.ads, ads) &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
            const DeepCollectionEquality().equals(other.popup, popup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      collection,
      const DeepCollectionEquality().hash(services),
      const DeepCollectionEquality().hash(subCollection),
      const DeepCollectionEquality().hash(ads),
      const DeepCollectionEquality().hash(promotions),
      const DeepCollectionEquality().hash(popup));

  @override
  String toString() {
    return 'CollectionDetailsModel(collection: $collection, services: $services, subCollection: $subCollection, ads: $ads, promotions: $promotions, popup: $popup)';
  }
}

/// @nodoc
abstract mixin class $CollectionDetailsModelCopyWith<$Res> {
  factory $CollectionDetailsModelCopyWith(CollectionDetailsModel value,
          $Res Function(CollectionDetailsModel) _then) =
      _$CollectionDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {String? collection,
      List<dynamic>? services,
      List<SubCollectionItemModel>? subCollection,
      List<CollectionAdModel>? ads,
      List<CollectionPromotionModel>? promotions,
      dynamic popup});
}

/// @nodoc
class _$CollectionDetailsModelCopyWithImpl<$Res>
    implements $CollectionDetailsModelCopyWith<$Res> {
  _$CollectionDetailsModelCopyWithImpl(this._self, this._then);

  final CollectionDetailsModel _self;
  final $Res Function(CollectionDetailsModel) _then;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = freezed,
    Object? services = freezed,
    Object? subCollection = freezed,
    Object? ads = freezed,
    Object? promotions = freezed,
    Object? popup = freezed,
  }) {
    return _then(_self.copyWith(
      collection: freezed == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      subCollection: freezed == subCollection
          ? _self.subCollection
          : subCollection // ignore: cast_nullable_to_non_nullable
              as List<SubCollectionItemModel>?,
      ads: freezed == ads
          ? _self.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<CollectionAdModel>?,
      promotions: freezed == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<CollectionPromotionModel>?,
      popup: freezed == popup
          ? _self.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CollectionDetailsModel implements CollectionDetailsModel {
  const _CollectionDetailsModel(
      {this.collection,
      final List<dynamic>? services,
      final List<SubCollectionItemModel>? subCollection,
      final List<CollectionAdModel>? ads,
      final List<CollectionPromotionModel>? promotions,
      this.popup})
      : _services = services,
        _subCollection = subCollection,
        _ads = ads,
        _promotions = promotions;
  factory _CollectionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsModelFromJson(json);

  @override
  final String? collection;
  final List<dynamic>? _services;
  @override
  List<dynamic>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SubCollectionItemModel>? _subCollection;
  @override
  List<SubCollectionItemModel>? get subCollection {
    final value = _subCollection;
    if (value == null) return null;
    if (_subCollection is EqualUnmodifiableListView) return _subCollection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CollectionAdModel>? _ads;
  @override
  List<CollectionAdModel>? get ads {
    final value = _ads;
    if (value == null) return null;
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CollectionPromotionModel>? _promotions;
  @override
  List<CollectionPromotionModel>? get promotions {
    final value = _promotions;
    if (value == null) return null;
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic popup;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionDetailsModelCopyWith<_CollectionDetailsModel> get copyWith =>
      __$CollectionDetailsModelCopyWithImpl<_CollectionDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectionDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CollectionDetailsModel &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._subCollection, _subCollection) &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            const DeepCollectionEquality().equals(other.popup, popup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      collection,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_subCollection),
      const DeepCollectionEquality().hash(_ads),
      const DeepCollectionEquality().hash(_promotions),
      const DeepCollectionEquality().hash(popup));

  @override
  String toString() {
    return 'CollectionDetailsModel(collection: $collection, services: $services, subCollection: $subCollection, ads: $ads, promotions: $promotions, popup: $popup)';
  }
}

/// @nodoc
abstract mixin class _$CollectionDetailsModelCopyWith<$Res>
    implements $CollectionDetailsModelCopyWith<$Res> {
  factory _$CollectionDetailsModelCopyWith(_CollectionDetailsModel value,
          $Res Function(_CollectionDetailsModel) _then) =
      __$CollectionDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? collection,
      List<dynamic>? services,
      List<SubCollectionItemModel>? subCollection,
      List<CollectionAdModel>? ads,
      List<CollectionPromotionModel>? promotions,
      dynamic popup});
}

/// @nodoc
class __$CollectionDetailsModelCopyWithImpl<$Res>
    implements _$CollectionDetailsModelCopyWith<$Res> {
  __$CollectionDetailsModelCopyWithImpl(this._self, this._then);

  final _CollectionDetailsModel _self;
  final $Res Function(_CollectionDetailsModel) _then;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? collection = freezed,
    Object? services = freezed,
    Object? subCollection = freezed,
    Object? ads = freezed,
    Object? promotions = freezed,
    Object? popup = freezed,
  }) {
    return _then(_CollectionDetailsModel(
      collection: freezed == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      subCollection: freezed == subCollection
          ? _self._subCollection
          : subCollection // ignore: cast_nullable_to_non_nullable
              as List<SubCollectionItemModel>?,
      ads: freezed == ads
          ? _self._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<CollectionAdModel>?,
      promotions: freezed == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<CollectionPromotionModel>?,
      popup: freezed == popup
          ? _self.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$SubCollectionItemModel {
  int? get id;
  String? get title;
  String? get media;

  /// Create a copy of SubCollectionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubCollectionItemModelCopyWith<SubCollectionItemModel> get copyWith =>
      _$SubCollectionItemModelCopyWithImpl<SubCollectionItemModel>(
          this as SubCollectionItemModel, _$identity);

  /// Serializes this SubCollectionItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubCollectionItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, media);

  @override
  String toString() {
    return 'SubCollectionItemModel(id: $id, title: $title, media: $media)';
  }
}

/// @nodoc
abstract mixin class $SubCollectionItemModelCopyWith<$Res> {
  factory $SubCollectionItemModelCopyWith(SubCollectionItemModel value,
          $Res Function(SubCollectionItemModel) _then) =
      _$SubCollectionItemModelCopyWithImpl;
  @useResult
  $Res call({int? id, String? title, String? media});
}

/// @nodoc
class _$SubCollectionItemModelCopyWithImpl<$Res>
    implements $SubCollectionItemModelCopyWith<$Res> {
  _$SubCollectionItemModelCopyWithImpl(this._self, this._then);

  final SubCollectionItemModel _self;
  final $Res Function(SubCollectionItemModel) _then;

  /// Create a copy of SubCollectionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? media = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubCollectionItemModel implements SubCollectionItemModel {
  const _SubCollectionItemModel({this.id, this.title, this.media});
  factory _SubCollectionItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubCollectionItemModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? media;

  /// Create a copy of SubCollectionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubCollectionItemModelCopyWith<_SubCollectionItemModel> get copyWith =>
      __$SubCollectionItemModelCopyWithImpl<_SubCollectionItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubCollectionItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubCollectionItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, media);

  @override
  String toString() {
    return 'SubCollectionItemModel(id: $id, title: $title, media: $media)';
  }
}

/// @nodoc
abstract mixin class _$SubCollectionItemModelCopyWith<$Res>
    implements $SubCollectionItemModelCopyWith<$Res> {
  factory _$SubCollectionItemModelCopyWith(_SubCollectionItemModel value,
          $Res Function(_SubCollectionItemModel) _then) =
      __$SubCollectionItemModelCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? title, String? media});
}

/// @nodoc
class __$SubCollectionItemModelCopyWithImpl<$Res>
    implements _$SubCollectionItemModelCopyWith<$Res> {
  __$SubCollectionItemModelCopyWithImpl(this._self, this._then);

  final _SubCollectionItemModel _self;
  final $Res Function(_SubCollectionItemModel) _then;

  /// Create a copy of SubCollectionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? media = freezed,
  }) {
    return _then(_SubCollectionItemModel(
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
    ));
  }
}

// dart format on
