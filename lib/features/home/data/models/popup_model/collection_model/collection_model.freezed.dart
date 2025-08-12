// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollectionModel {
  int? get id;
  String? get title;
  dynamic get showType;
  dynamic get column;
  dynamic get tag;
  String? get media;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectionModelCopyWith<CollectionModel> get copyWith =>
      _$CollectionModelCopyWithImpl<CollectionModel>(
          this as CollectionModel, _$identity);

  /// Serializes this CollectionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CollectionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.showType, showType) &&
            const DeepCollectionEquality().equals(other.column, column) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(showType),
      const DeepCollectionEquality().hash(column),
      const DeepCollectionEquality().hash(tag),
      media);

  @override
  String toString() {
    return 'CollectionModel(id: $id, title: $title, showType: $showType, column: $column, tag: $tag, media: $media)';
  }
}

/// @nodoc
abstract mixin class $CollectionModelCopyWith<$Res> {
  factory $CollectionModelCopyWith(
          CollectionModel value, $Res Function(CollectionModel) _then) =
      _$CollectionModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      dynamic showType,
      dynamic column,
      dynamic tag,
      String? media});
}

/// @nodoc
class _$CollectionModelCopyWithImpl<$Res>
    implements $CollectionModelCopyWith<$Res> {
  _$CollectionModelCopyWithImpl(this._self, this._then);

  final CollectionModel _self;
  final $Res Function(CollectionModel) _then;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? showType = freezed,
    Object? column = freezed,
    Object? tag = freezed,
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
      showType: freezed == showType
          ? _self.showType
          : showType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      column: freezed == column
          ? _self.column
          : column // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tag: freezed == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
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
class _CollectionModel implements CollectionModel {
  const _CollectionModel(
      {this.id, this.title, this.showType, this.column, this.tag, this.media});
  factory _CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final dynamic showType;
  @override
  final dynamic column;
  @override
  final dynamic tag;
  @override
  final String? media;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectionModelCopyWith<_CollectionModel> get copyWith =>
      __$CollectionModelCopyWithImpl<_CollectionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CollectionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.showType, showType) &&
            const DeepCollectionEquality().equals(other.column, column) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(showType),
      const DeepCollectionEquality().hash(column),
      const DeepCollectionEquality().hash(tag),
      media);

  @override
  String toString() {
    return 'CollectionModel(id: $id, title: $title, showType: $showType, column: $column, tag: $tag, media: $media)';
  }
}

/// @nodoc
abstract mixin class _$CollectionModelCopyWith<$Res>
    implements $CollectionModelCopyWith<$Res> {
  factory _$CollectionModelCopyWith(
          _CollectionModel value, $Res Function(_CollectionModel) _then) =
      __$CollectionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      dynamic showType,
      dynamic column,
      dynamic tag,
      String? media});
}

/// @nodoc
class __$CollectionModelCopyWithImpl<$Res>
    implements _$CollectionModelCopyWith<$Res> {
  __$CollectionModelCopyWithImpl(this._self, this._then);

  final _CollectionModel _self;
  final $Res Function(_CollectionModel) _then;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? showType = freezed,
    Object? column = freezed,
    Object? tag = freezed,
    Object? media = freezed,
  }) {
    return _then(_CollectionModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      showType: freezed == showType
          ? _self.showType
          : showType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      column: freezed == column
          ? _self.column
          : column // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tag: freezed == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
