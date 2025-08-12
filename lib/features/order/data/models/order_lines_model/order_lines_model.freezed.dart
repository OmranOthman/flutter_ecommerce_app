// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_lines_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderLinesModel {
  int? get id;
  String? get name;
  String? get media;
  @JsonKey(name: "purchasable_type")
  String? get purchasableType;
  @JsonKey(name: "purchasable_id")
  int? get purchasableId;
  @JsonKey(name: "unit_price")
  int? get unitPrice;
  int? get quantity;
  @JsonKey(name: "discount_type")
  int? get discountType;
  @JsonKey(name: "discount_amount")
  int? get discountAmount;
  int? get total;
  String? get note;

  /// Create a copy of OrderLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderLinesModelCopyWith<OrderLinesModel> get copyWith =>
      _$OrderLinesModelCopyWithImpl<OrderLinesModel>(
          this as OrderLinesModel, _$identity);

  /// Serializes this OrderLinesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderLinesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.purchasableType, purchasableType) ||
                other.purchasableType == purchasableType) &&
            (identical(other.purchasableId, purchasableId) ||
                other.purchasableId == purchasableId) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      media,
      purchasableType,
      purchasableId,
      unitPrice,
      quantity,
      discountType,
      discountAmount,
      total,
      note);

  @override
  String toString() {
    return 'OrderLinesModel(id: $id, name: $name, media: $media, purchasableType: $purchasableType, purchasableId: $purchasableId, unitPrice: $unitPrice, quantity: $quantity, discountType: $discountType, discountAmount: $discountAmount, total: $total, note: $note)';
  }
}

/// @nodoc
abstract mixin class $OrderLinesModelCopyWith<$Res> {
  factory $OrderLinesModelCopyWith(
          OrderLinesModel value, $Res Function(OrderLinesModel) _then) =
      _$OrderLinesModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? media,
      @JsonKey(name: "purchasable_type") String? purchasableType,
      @JsonKey(name: "purchasable_id") int? purchasableId,
      @JsonKey(name: "unit_price") int? unitPrice,
      int? quantity,
      @JsonKey(name: "discount_type") int? discountType,
      @JsonKey(name: "discount_amount") int? discountAmount,
      int? total,
      String? note});
}

/// @nodoc
class _$OrderLinesModelCopyWithImpl<$Res>
    implements $OrderLinesModelCopyWith<$Res> {
  _$OrderLinesModelCopyWithImpl(this._self, this._then);

  final OrderLinesModel _self;
  final $Res Function(OrderLinesModel) _then;

  /// Create a copy of OrderLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? media = freezed,
    Object? purchasableType = freezed,
    Object? purchasableId = freezed,
    Object? unitPrice = freezed,
    Object? quantity = freezed,
    Object? discountType = freezed,
    Object? discountAmount = freezed,
    Object? total = freezed,
    Object? note = freezed,
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
      purchasableType: freezed == purchasableType
          ? _self.purchasableType
          : purchasableType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasableId: freezed == purchasableId
          ? _self.purchasableId
          : purchasableId // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as int?,
      discountAmount: freezed == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OrderLinesModel implements OrderLinesModel {
  const _OrderLinesModel(
      {this.id,
      this.name,
      this.media,
      @JsonKey(name: "purchasable_type") this.purchasableType,
      @JsonKey(name: "purchasable_id") this.purchasableId,
      @JsonKey(name: "unit_price") this.unitPrice,
      this.quantity,
      @JsonKey(name: "discount_type") this.discountType,
      @JsonKey(name: "discount_amount") this.discountAmount,
      this.total,
      this.note});
  factory _OrderLinesModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLinesModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? media;
  @override
  @JsonKey(name: "purchasable_type")
  final String? purchasableType;
  @override
  @JsonKey(name: "purchasable_id")
  final int? purchasableId;
  @override
  @JsonKey(name: "unit_price")
  final int? unitPrice;
  @override
  final int? quantity;
  @override
  @JsonKey(name: "discount_type")
  final int? discountType;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;
  @override
  final int? total;
  @override
  final String? note;

  /// Create a copy of OrderLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderLinesModelCopyWith<_OrderLinesModel> get copyWith =>
      __$OrderLinesModelCopyWithImpl<_OrderLinesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderLinesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderLinesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.purchasableType, purchasableType) ||
                other.purchasableType == purchasableType) &&
            (identical(other.purchasableId, purchasableId) ||
                other.purchasableId == purchasableId) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      media,
      purchasableType,
      purchasableId,
      unitPrice,
      quantity,
      discountType,
      discountAmount,
      total,
      note);

  @override
  String toString() {
    return 'OrderLinesModel(id: $id, name: $name, media: $media, purchasableType: $purchasableType, purchasableId: $purchasableId, unitPrice: $unitPrice, quantity: $quantity, discountType: $discountType, discountAmount: $discountAmount, total: $total, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$OrderLinesModelCopyWith<$Res>
    implements $OrderLinesModelCopyWith<$Res> {
  factory _$OrderLinesModelCopyWith(
          _OrderLinesModel value, $Res Function(_OrderLinesModel) _then) =
      __$OrderLinesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? media,
      @JsonKey(name: "purchasable_type") String? purchasableType,
      @JsonKey(name: "purchasable_id") int? purchasableId,
      @JsonKey(name: "unit_price") int? unitPrice,
      int? quantity,
      @JsonKey(name: "discount_type") int? discountType,
      @JsonKey(name: "discount_amount") int? discountAmount,
      int? total,
      String? note});
}

/// @nodoc
class __$OrderLinesModelCopyWithImpl<$Res>
    implements _$OrderLinesModelCopyWith<$Res> {
  __$OrderLinesModelCopyWithImpl(this._self, this._then);

  final _OrderLinesModel _self;
  final $Res Function(_OrderLinesModel) _then;

  /// Create a copy of OrderLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? media = freezed,
    Object? purchasableType = freezed,
    Object? purchasableId = freezed,
    Object? unitPrice = freezed,
    Object? quantity = freezed,
    Object? discountType = freezed,
    Object? discountAmount = freezed,
    Object? total = freezed,
    Object? note = freezed,
  }) {
    return _then(_OrderLinesModel(
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
      purchasableType: freezed == purchasableType
          ? _self.purchasableType
          : purchasableType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasableId: freezed == purchasableId
          ? _self.purchasableId
          : purchasableId // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _self.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as int?,
      discountAmount: freezed == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
