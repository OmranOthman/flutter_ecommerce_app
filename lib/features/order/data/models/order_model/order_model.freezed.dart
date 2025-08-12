// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {
  int? get id;
  String? get status;
  @JsonKey(name: "status_value")
  int? get statusValue;
  @JsonKey(name: "vendor_name")
  String? get vendorName;
  @JsonKey(name: "vendor_brand_image")
  String? get vendorBrandImage;
  int? get total;
  String? get note;
  String? get address;
  int? get fee;
  int? get subtotal;
  @JsonKey(name: "discount_total")
  int? get discountTotal;
  @JsonKey(name: "expected_prep_time")
  dynamic get expectedPrepTime;
  @JsonKey(name: "payment_status")
  String? get paymentStatus;
  @JsonKey(name: "payment_method")
  String? get paymentMethod;
  @JsonKey(name: "created_at")
  String? get createdAt;
  @JsonKey(name: "order_lines")
  List<OrderLinesModel>? get orderLines;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusValue, statusValue) ||
                other.statusValue == statusValue) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.vendorBrandImage, vendorBrandImage) ||
                other.vendorBrandImage == vendorBrandImage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            const DeepCollectionEquality()
                .equals(other.expectedPrepTime, expectedPrepTime) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other.orderLines, orderLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      statusValue,
      vendorName,
      vendorBrandImage,
      total,
      note,
      address,
      fee,
      subtotal,
      discountTotal,
      const DeepCollectionEquality().hash(expectedPrepTime),
      paymentStatus,
      paymentMethod,
      createdAt,
      const DeepCollectionEquality().hash(orderLines));

  @override
  String toString() {
    return 'OrderModel(id: $id, status: $status, statusValue: $statusValue, vendorName: $vendorName, vendorBrandImage: $vendorBrandImage, total: $total, note: $note, address: $address, fee: $fee, subtotal: $subtotal, discountTotal: $discountTotal, expectedPrepTime: $expectedPrepTime, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, createdAt: $createdAt, orderLines: $orderLines)';
  }
}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? status,
      @JsonKey(name: "status_value") int? statusValue,
      @JsonKey(name: "vendor_name") String? vendorName,
      @JsonKey(name: "vendor_brand_image") String? vendorBrandImage,
      int? total,
      String? note,
      String? address,
      int? fee,
      int? subtotal,
      @JsonKey(name: "discount_total") int? discountTotal,
      @JsonKey(name: "expected_prep_time") dynamic expectedPrepTime,
      @JsonKey(name: "payment_status") String? paymentStatus,
      @JsonKey(name: "payment_method") String? paymentMethod,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "order_lines") List<OrderLinesModel>? orderLines});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? statusValue = freezed,
    Object? vendorName = freezed,
    Object? vendorBrandImage = freezed,
    Object? total = freezed,
    Object? note = freezed,
    Object? address = freezed,
    Object? fee = freezed,
    Object? subtotal = freezed,
    Object? discountTotal = freezed,
    Object? expectedPrepTime = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? createdAt = freezed,
    Object? orderLines = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusValue: freezed == statusValue
          ? _self.statusValue
          : statusValue // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorName: freezed == vendorName
          ? _self.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorBrandImage: freezed == vendorBrandImage
          ? _self.vendorBrandImage
          : vendorBrandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: freezed == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int?,
      discountTotal: freezed == discountTotal
          ? _self.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedPrepTime: freezed == expectedPrepTime
          ? _self.expectedPrepTime
          : expectedPrepTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      orderLines: freezed == orderLines
          ? _self.orderLines
          : orderLines // ignore: cast_nullable_to_non_nullable
              as List<OrderLinesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OrderModel implements OrderModel {
  const _OrderModel(
      {this.id,
      this.status,
      @JsonKey(name: "status_value") this.statusValue,
      @JsonKey(name: "vendor_name") this.vendorName,
      @JsonKey(name: "vendor_brand_image") this.vendorBrandImage,
      this.total,
      this.note,
      this.address,
      this.fee,
      this.subtotal,
      @JsonKey(name: "discount_total") this.discountTotal,
      @JsonKey(name: "expected_prep_time") this.expectedPrepTime,
      @JsonKey(name: "payment_status") this.paymentStatus,
      @JsonKey(name: "payment_method") this.paymentMethod,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "order_lines") final List<OrderLinesModel>? orderLines})
      : _orderLines = orderLines;
  factory _OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  final int? id;
  @override
  final String? status;
  @override
  @JsonKey(name: "status_value")
  final int? statusValue;
  @override
  @JsonKey(name: "vendor_name")
  final String? vendorName;
  @override
  @JsonKey(name: "vendor_brand_image")
  final String? vendorBrandImage;
  @override
  final int? total;
  @override
  final String? note;
  @override
  final String? address;
  @override
  final int? fee;
  @override
  final int? subtotal;
  @override
  @JsonKey(name: "discount_total")
  final int? discountTotal;
  @override
  @JsonKey(name: "expected_prep_time")
  final dynamic expectedPrepTime;
  @override
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @override
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  final List<OrderLinesModel>? _orderLines;
  @override
  @JsonKey(name: "order_lines")
  List<OrderLinesModel>? get orderLines {
    final value = _orderLines;
    if (value == null) return null;
    if (_orderLines is EqualUnmodifiableListView) return _orderLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusValue, statusValue) ||
                other.statusValue == statusValue) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.vendorBrandImage, vendorBrandImage) ||
                other.vendorBrandImage == vendorBrandImage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            const DeepCollectionEquality()
                .equals(other.expectedPrepTime, expectedPrepTime) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._orderLines, _orderLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      statusValue,
      vendorName,
      vendorBrandImage,
      total,
      note,
      address,
      fee,
      subtotal,
      discountTotal,
      const DeepCollectionEquality().hash(expectedPrepTime),
      paymentStatus,
      paymentMethod,
      createdAt,
      const DeepCollectionEquality().hash(_orderLines));

  @override
  String toString() {
    return 'OrderModel(id: $id, status: $status, statusValue: $statusValue, vendorName: $vendorName, vendorBrandImage: $vendorBrandImage, total: $total, note: $note, address: $address, fee: $fee, subtotal: $subtotal, discountTotal: $discountTotal, expectedPrepTime: $expectedPrepTime, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, createdAt: $createdAt, orderLines: $orderLines)';
  }
}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? status,
      @JsonKey(name: "status_value") int? statusValue,
      @JsonKey(name: "vendor_name") String? vendorName,
      @JsonKey(name: "vendor_brand_image") String? vendorBrandImage,
      int? total,
      String? note,
      String? address,
      int? fee,
      int? subtotal,
      @JsonKey(name: "discount_total") int? discountTotal,
      @JsonKey(name: "expected_prep_time") dynamic expectedPrepTime,
      @JsonKey(name: "payment_status") String? paymentStatus,
      @JsonKey(name: "payment_method") String? paymentMethod,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "order_lines") List<OrderLinesModel>? orderLines});
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? statusValue = freezed,
    Object? vendorName = freezed,
    Object? vendorBrandImage = freezed,
    Object? total = freezed,
    Object? note = freezed,
    Object? address = freezed,
    Object? fee = freezed,
    Object? subtotal = freezed,
    Object? discountTotal = freezed,
    Object? expectedPrepTime = freezed,
    Object? paymentStatus = freezed,
    Object? paymentMethod = freezed,
    Object? createdAt = freezed,
    Object? orderLines = freezed,
  }) {
    return _then(_OrderModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      statusValue: freezed == statusValue
          ? _self.statusValue
          : statusValue // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorName: freezed == vendorName
          ? _self.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorBrandImage: freezed == vendorBrandImage
          ? _self.vendorBrandImage
          : vendorBrandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: freezed == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int?,
      discountTotal: freezed == discountTotal
          ? _self.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      expectedPrepTime: freezed == expectedPrepTime
          ? _self.expectedPrepTime
          : expectedPrepTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      orderLines: freezed == orderLines
          ? _self._orderLines
          : orderLines // ignore: cast_nullable_to_non_nullable
              as List<OrderLinesModel>?,
    ));
  }
}

// dart format on
