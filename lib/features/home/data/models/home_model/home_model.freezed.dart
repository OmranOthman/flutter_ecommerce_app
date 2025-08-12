// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeModel {
  List<PromotionModel>? get promotions;
  List<CollectionModel>? get collections;
  List<AdModel>? get ads;
  PopupModel? get popup;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeModelCopyWith<HomeModel> get copyWith =>
      _$HomeModelCopyWithImpl<HomeModel>(this as HomeModel, _$identity);

  /// Serializes this HomeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeModel &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions) &&
            const DeepCollectionEquality()
                .equals(other.collections, collections) &&
            const DeepCollectionEquality().equals(other.ads, ads) &&
            (identical(other.popup, popup) || other.popup == popup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(promotions),
      const DeepCollectionEquality().hash(collections),
      const DeepCollectionEquality().hash(ads),
      popup);

  @override
  String toString() {
    return 'HomeModel(promotions: $promotions, collections: $collections, ads: $ads, popup: $popup)';
  }
}

/// @nodoc
abstract mixin class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) _then) =
      _$HomeModelCopyWithImpl;
  @useResult
  $Res call(
      {List<PromotionModel>? promotions,
      List<CollectionModel>? collections,
      List<AdModel>? ads,
      PopupModel? popup});

  $PopupModelCopyWith<$Res>? get popup;
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._self, this._then);

  final HomeModel _self;
  final $Res Function(HomeModel) _then;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = freezed,
    Object? collections = freezed,
    Object? ads = freezed,
    Object? popup = freezed,
  }) {
    return _then(_self.copyWith(
      promotions: freezed == promotions
          ? _self.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionModel>?,
      collections: freezed == collections
          ? _self.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>?,
      ads: freezed == ads
          ? _self.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>?,
      popup: freezed == popup
          ? _self.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as PopupModel?,
    ));
  }

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PopupModelCopyWith<$Res>? get popup {
    if (_self.popup == null) {
      return null;
    }

    return $PopupModelCopyWith<$Res>(_self.popup!, (value) {
      return _then(_self.copyWith(popup: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _HomeModel implements HomeModel {
  const _HomeModel(
      {final List<PromotionModel>? promotions,
      final List<CollectionModel>? collections,
      final List<AdModel>? ads,
      this.popup})
      : _promotions = promotions,
        _collections = collections,
        _ads = ads;
  factory _HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  final List<PromotionModel>? _promotions;
  @override
  List<PromotionModel>? get promotions {
    final value = _promotions;
    if (value == null) return null;
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CollectionModel>? _collections;
  @override
  List<CollectionModel>? get collections {
    final value = _collections;
    if (value == null) return null;
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AdModel>? _ads;
  @override
  List<AdModel>? get ads {
    final value = _ads;
    if (value == null) return null;
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PopupModel? popup;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeModelCopyWith<_HomeModel> get copyWith =>
      __$HomeModelCopyWithImpl<_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeModel &&
            const DeepCollectionEquality()
                .equals(other._promotions, _promotions) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            (identical(other.popup, popup) || other.popup == popup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_promotions),
      const DeepCollectionEquality().hash(_collections),
      const DeepCollectionEquality().hash(_ads),
      popup);

  @override
  String toString() {
    return 'HomeModel(promotions: $promotions, collections: $collections, ads: $ads, popup: $popup)';
  }
}

/// @nodoc
abstract mixin class _$HomeModelCopyWith<$Res>
    implements $HomeModelCopyWith<$Res> {
  factory _$HomeModelCopyWith(
          _HomeModel value, $Res Function(_HomeModel) _then) =
      __$HomeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PromotionModel>? promotions,
      List<CollectionModel>? collections,
      List<AdModel>? ads,
      PopupModel? popup});

  @override
  $PopupModelCopyWith<$Res>? get popup;
}

/// @nodoc
class __$HomeModelCopyWithImpl<$Res> implements _$HomeModelCopyWith<$Res> {
  __$HomeModelCopyWithImpl(this._self, this._then);

  final _HomeModel _self;
  final $Res Function(_HomeModel) _then;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promotions = freezed,
    Object? collections = freezed,
    Object? ads = freezed,
    Object? popup = freezed,
  }) {
    return _then(_HomeModel(
      promotions: freezed == promotions
          ? _self._promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<PromotionModel>?,
      collections: freezed == collections
          ? _self._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>?,
      ads: freezed == ads
          ? _self._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>?,
      popup: freezed == popup
          ? _self.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as PopupModel?,
    ));
  }

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PopupModelCopyWith<$Res>? get popup {
    if (_self.popup == null) {
      return null;
    }

    return $PopupModelCopyWith<$Res>(_self.popup!, (value) {
      return _then(_self.copyWith(popup: value));
    });
  }
}

// dart format on
