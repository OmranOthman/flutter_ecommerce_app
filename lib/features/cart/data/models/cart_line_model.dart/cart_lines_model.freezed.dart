// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_lines_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartLinesModel {
  int? get id;
  @JsonKey(name: "purchasable_type")
  String? get purchasableType;
  @JsonKey(name: "purchasable_id")
  int? get purchasableId;
  @JsonKey(name: "vendor_id")
  int? get vendorId;
  @JsonKey(name: "vendor_services")
  List<dynamic>? get vendorServices;
  String? get media;
  @JsonKey(name: "price_per_product")
  int? get pricePerProduct;
  @JsonKey(name: "price_before_discount")
  String? get priceBeforeDiscount;
  int? get price;
  int? get stock;
  String? get purchasable;
  @JsonKey(name: "quantity_increment")
  int? get quantityIncrement;
  @JsonKey(name: "min_quantity")
  int? get minQuantity;
  @JsonKey(name: "unit_quantity")
  int? get unitQuantity;
  String? get name;
  int? get quantity;
  String? get note;
  List<dynamic>? get meta;
  bool? get available;

  /// Create a copy of CartLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartLinesModelCopyWith<CartLinesModel> get copyWith =>
      _$CartLinesModelCopyWithImpl<CartLinesModel>(
          this as CartLinesModel, _$identity);

  /// Serializes this CartLinesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartLinesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchasableType, purchasableType) ||
                other.purchasableType == purchasableType) &&
            (identical(other.purchasableId, purchasableId) ||
                other.purchasableId == purchasableId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            const DeepCollectionEquality()
                .equals(other.vendorServices, vendorServices) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.pricePerProduct, pricePerProduct) ||
                other.pricePerProduct == pricePerProduct) &&
            (identical(other.priceBeforeDiscount, priceBeforeDiscount) ||
                other.priceBeforeDiscount == priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.unitQuantity, unitQuantity) ||
                other.unitQuantity == unitQuantity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        purchasableType,
        purchasableId,
        vendorId,
        const DeepCollectionEquality().hash(vendorServices),
        media,
        pricePerProduct,
        priceBeforeDiscount,
        price,
        stock,
        purchasable,
        quantityIncrement,
        minQuantity,
        unitQuantity,
        name,
        quantity,
        note,
        const DeepCollectionEquality().hash(meta),
        available
      ]);

  @override
  String toString() {
    return 'CartLinesModel(id: $id, purchasableType: $purchasableType, purchasableId: $purchasableId, vendorId: $vendorId, vendorServices: $vendorServices, media: $media, pricePerProduct: $pricePerProduct, priceBeforeDiscount: $priceBeforeDiscount, price: $price, stock: $stock, purchasable: $purchasable, quantityIncrement: $quantityIncrement, minQuantity: $minQuantity, unitQuantity: $unitQuantity, name: $name, quantity: $quantity, note: $note, meta: $meta, available: $available)';
  }
}

/// @nodoc
abstract mixin class $CartLinesModelCopyWith<$Res> {
  factory $CartLinesModelCopyWith(
          CartLinesModel value, $Res Function(CartLinesModel) _then) =
      _$CartLinesModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "purchasable_type") String? purchasableType,
      @JsonKey(name: "purchasable_id") int? purchasableId,
      @JsonKey(name: "vendor_id") int? vendorId,
      @JsonKey(name: "vendor_services") List<dynamic>? vendorServices,
      String? media,
      @JsonKey(name: "price_per_product") int? pricePerProduct,
      @JsonKey(name: "price_before_discount") String? priceBeforeDiscount,
      int? price,
      int? stock,
      String? purchasable,
      @JsonKey(name: "quantity_increment") int? quantityIncrement,
      @JsonKey(name: "min_quantity") int? minQuantity,
      @JsonKey(name: "unit_quantity") int? unitQuantity,
      String? name,
      int? quantity,
      String? note,
      List<dynamic>? meta,
      bool? available});
}

/// @nodoc
class _$CartLinesModelCopyWithImpl<$Res>
    implements $CartLinesModelCopyWith<$Res> {
  _$CartLinesModelCopyWithImpl(this._self, this._then);

  final CartLinesModel _self;
  final $Res Function(CartLinesModel) _then;

  /// Create a copy of CartLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? purchasableType = freezed,
    Object? purchasableId = freezed,
    Object? vendorId = freezed,
    Object? vendorServices = freezed,
    Object? media = freezed,
    Object? pricePerProduct = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? purchasable = freezed,
    Object? quantityIncrement = freezed,
    Object? minQuantity = freezed,
    Object? unitQuantity = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? note = freezed,
    Object? meta = freezed,
    Object? available = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasableType: freezed == purchasableType
          ? _self.purchasableType
          : purchasableType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasableId: freezed == purchasableId
          ? _self.purchasableId
          : purchasableId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorServices: freezed == vendorServices
          ? _self.vendorServices
          : vendorServices // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerProduct: freezed == pricePerProduct
          ? _self.pricePerProduct
          : pricePerProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitQuantity: freezed == unitQuantity
          ? _self.unitQuantity
          : unitQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CartLinesModel implements CartLinesModel {
  _CartLinesModel(
      {this.id,
      @JsonKey(name: "purchasable_type") this.purchasableType,
      @JsonKey(name: "purchasable_id") this.purchasableId,
      @JsonKey(name: "vendor_id") this.vendorId,
      @JsonKey(name: "vendor_services") final List<dynamic>? vendorServices,
      this.media,
      @JsonKey(name: "price_per_product") this.pricePerProduct,
      @JsonKey(name: "price_before_discount") this.priceBeforeDiscount,
      this.price,
      this.stock,
      this.purchasable,
      @JsonKey(name: "quantity_increment") this.quantityIncrement,
      @JsonKey(name: "min_quantity") this.minQuantity,
      @JsonKey(name: "unit_quantity") this.unitQuantity,
      this.name,
      this.quantity,
      this.note,
      final List<dynamic>? meta,
      this.available})
      : _vendorServices = vendorServices,
        _meta = meta;
  factory _CartLinesModel.fromJson(Map<String, dynamic> json) =>
      _$CartLinesModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "purchasable_type")
  final String? purchasableType;
  @override
  @JsonKey(name: "purchasable_id")
  final int? purchasableId;
  @override
  @JsonKey(name: "vendor_id")
  final int? vendorId;
  final List<dynamic>? _vendorServices;
  @override
  @JsonKey(name: "vendor_services")
  List<dynamic>? get vendorServices {
    final value = _vendorServices;
    if (value == null) return null;
    if (_vendorServices is EqualUnmodifiableListView) return _vendorServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? media;
  @override
  @JsonKey(name: "price_per_product")
  final int? pricePerProduct;
  @override
  @JsonKey(name: "price_before_discount")
  final String? priceBeforeDiscount;
  @override
  final int? price;
  @override
  final int? stock;
  @override
  final String? purchasable;
  @override
  @JsonKey(name: "quantity_increment")
  final int? quantityIncrement;
  @override
  @JsonKey(name: "min_quantity")
  final int? minQuantity;
  @override
  @JsonKey(name: "unit_quantity")
  final int? unitQuantity;
  @override
  final String? name;
  @override
  final int? quantity;
  @override
  final String? note;
  final List<dynamic>? _meta;
  @override
  List<dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableListView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? available;

  /// Create a copy of CartLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartLinesModelCopyWith<_CartLinesModel> get copyWith =>
      __$CartLinesModelCopyWithImpl<_CartLinesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartLinesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartLinesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchasableType, purchasableType) ||
                other.purchasableType == purchasableType) &&
            (identical(other.purchasableId, purchasableId) ||
                other.purchasableId == purchasableId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            const DeepCollectionEquality()
                .equals(other._vendorServices, _vendorServices) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.pricePerProduct, pricePerProduct) ||
                other.pricePerProduct == pricePerProduct) &&
            (identical(other.priceBeforeDiscount, priceBeforeDiscount) ||
                other.priceBeforeDiscount == priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.unitQuantity, unitQuantity) ||
                other.unitQuantity == unitQuantity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        purchasableType,
        purchasableId,
        vendorId,
        const DeepCollectionEquality().hash(_vendorServices),
        media,
        pricePerProduct,
        priceBeforeDiscount,
        price,
        stock,
        purchasable,
        quantityIncrement,
        minQuantity,
        unitQuantity,
        name,
        quantity,
        note,
        const DeepCollectionEquality().hash(_meta),
        available
      ]);

  @override
  String toString() {
    return 'CartLinesModel(id: $id, purchasableType: $purchasableType, purchasableId: $purchasableId, vendorId: $vendorId, vendorServices: $vendorServices, media: $media, pricePerProduct: $pricePerProduct, priceBeforeDiscount: $priceBeforeDiscount, price: $price, stock: $stock, purchasable: $purchasable, quantityIncrement: $quantityIncrement, minQuantity: $minQuantity, unitQuantity: $unitQuantity, name: $name, quantity: $quantity, note: $note, meta: $meta, available: $available)';
  }
}

/// @nodoc
abstract mixin class _$CartLinesModelCopyWith<$Res>
    implements $CartLinesModelCopyWith<$Res> {
  factory _$CartLinesModelCopyWith(
          _CartLinesModel value, $Res Function(_CartLinesModel) _then) =
      __$CartLinesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "purchasable_type") String? purchasableType,
      @JsonKey(name: "purchasable_id") int? purchasableId,
      @JsonKey(name: "vendor_id") int? vendorId,
      @JsonKey(name: "vendor_services") List<dynamic>? vendorServices,
      String? media,
      @JsonKey(name: "price_per_product") int? pricePerProduct,
      @JsonKey(name: "price_before_discount") String? priceBeforeDiscount,
      int? price,
      int? stock,
      String? purchasable,
      @JsonKey(name: "quantity_increment") int? quantityIncrement,
      @JsonKey(name: "min_quantity") int? minQuantity,
      @JsonKey(name: "unit_quantity") int? unitQuantity,
      String? name,
      int? quantity,
      String? note,
      List<dynamic>? meta,
      bool? available});
}

/// @nodoc
class __$CartLinesModelCopyWithImpl<$Res>
    implements _$CartLinesModelCopyWith<$Res> {
  __$CartLinesModelCopyWithImpl(this._self, this._then);

  final _CartLinesModel _self;
  final $Res Function(_CartLinesModel) _then;

  /// Create a copy of CartLinesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? purchasableType = freezed,
    Object? purchasableId = freezed,
    Object? vendorId = freezed,
    Object? vendorServices = freezed,
    Object? media = freezed,
    Object? pricePerProduct = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? purchasable = freezed,
    Object? quantityIncrement = freezed,
    Object? minQuantity = freezed,
    Object? unitQuantity = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? note = freezed,
    Object? meta = freezed,
    Object? available = freezed,
  }) {
    return _then(_CartLinesModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasableType: freezed == purchasableType
          ? _self.purchasableType
          : purchasableType // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasableId: freezed == purchasableId
          ? _self.purchasableId
          : purchasableId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorServices: freezed == vendorServices
          ? _self._vendorServices
          : vendorServices // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerProduct: freezed == pricePerProduct
          ? _self.pricePerProduct
          : pricePerProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitQuantity: freezed == unitQuantity
          ? _self.unitQuantity
          : unitQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _self._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
