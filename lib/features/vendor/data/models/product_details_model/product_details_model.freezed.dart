// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetailsModel {
  int? get id;
  @JsonKey(name: 'vendor_id')
  int? get vendorId;
  @JsonKey(name: 'variant_id')
  int? get variantId;
  String? get name;
  String? get description;
  String? get sku;
  @JsonKey(name: 'min_quantity')
  int? get minQuantity;
  @JsonKey(name: 'quantity_increment')
  int? get quantityIncrement;
  @JsonKey(name: 'backorder_quantity')
  int? get backorderQuantity;
  int? get stock;
  String? get purchasable;
  @JsonKey(name: 'price_before_discount')
  dynamic get priceBeforeDiscount;
  num? get price;
  List<dynamic>? get addons;
  List<dynamic>? get tags;
  List<String>? get media;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  bool? get bogo;
  List<String>? get sizes;

  /// Create a copy of ProductDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductDetailsModelCopyWith<ProductDetailsModel> get copyWith =>
      _$ProductDetailsModelCopyWithImpl<ProductDetailsModel>(
          this as ProductDetailsModel, _$identity);

  /// Serializes this ProductDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.backorderQuantity, backorderQuantity) ||
                other.backorderQuantity == backorderQuantity) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            const DeepCollectionEquality()
                .equals(other.priceBeforeDiscount, priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other.addons, addons) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.bogo, bogo) || other.bogo == bogo) &&
            const DeepCollectionEquality().equals(other.sizes, sizes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        vendorId,
        variantId,
        name,
        description,
        sku,
        minQuantity,
        quantityIncrement,
        backorderQuantity,
        stock,
        purchasable,
        const DeepCollectionEquality().hash(priceBeforeDiscount),
        price,
        const DeepCollectionEquality().hash(addons),
        const DeepCollectionEquality().hash(tags),
        const DeepCollectionEquality().hash(media),
        isFavorite,
        bogo,
        const DeepCollectionEquality().hash(sizes)
      ]);

  @override
  String toString() {
    return 'ProductDetailsModel(id: $id, vendorId: $vendorId, variantId: $variantId, name: $name, description: $description, sku: $sku, minQuantity: $minQuantity, quantityIncrement: $quantityIncrement, backorderQuantity: $backorderQuantity, stock: $stock, purchasable: $purchasable, priceBeforeDiscount: $priceBeforeDiscount, price: $price, addons: $addons, tags: $tags, media: $media, isFavorite: $isFavorite, bogo: $bogo, sizes: $sizes)';
  }
}

/// @nodoc
abstract mixin class $ProductDetailsModelCopyWith<$Res> {
  factory $ProductDetailsModelCopyWith(
          ProductDetailsModel value, $Res Function(ProductDetailsModel) _then) =
      _$ProductDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'vendor_id') int? vendorId,
      @JsonKey(name: 'variant_id') int? variantId,
      String? name,
      String? description,
      String? sku,
      @JsonKey(name: 'min_quantity') int? minQuantity,
      @JsonKey(name: 'quantity_increment') int? quantityIncrement,
      @JsonKey(name: 'backorder_quantity') int? backorderQuantity,
      int? stock,
      String? purchasable,
      @JsonKey(name: 'price_before_discount') dynamic priceBeforeDiscount,
      num? price,
      List<dynamic>? addons,
      List<dynamic>? tags,
      List<String>? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      bool? bogo,
      List<String>? sizes});
}

/// @nodoc
class _$ProductDetailsModelCopyWithImpl<$Res>
    implements $ProductDetailsModelCopyWith<$Res> {
  _$ProductDetailsModelCopyWithImpl(this._self, this._then);

  final ProductDetailsModel _self;
  final $Res Function(ProductDetailsModel) _then;

  /// Create a copy of ProductDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vendorId = freezed,
    Object? variantId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sku = freezed,
    Object? minQuantity = freezed,
    Object? quantityIncrement = freezed,
    Object? backorderQuantity = freezed,
    Object? stock = freezed,
    Object? purchasable = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? addons = freezed,
    Object? tags = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? bogo = freezed,
    Object? sizes = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      backorderQuantity: freezed == backorderQuantity
          ? _self.backorderQuantity
          : backorderQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      addons: freezed == addons
          ? _self.addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      bogo: freezed == bogo
          ? _self.bogo
          : bogo // ignore: cast_nullable_to_non_nullable
              as bool?,
      sizes: freezed == sizes
          ? _self.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductDetailsModel implements ProductDetailsModel {
  _ProductDetailsModel(
      {this.id,
      @JsonKey(name: 'vendor_id') this.vendorId,
      @JsonKey(name: 'variant_id') this.variantId,
      this.name,
      this.description,
      this.sku,
      @JsonKey(name: 'min_quantity') this.minQuantity,
      @JsonKey(name: 'quantity_increment') this.quantityIncrement,
      @JsonKey(name: 'backorder_quantity') this.backorderQuantity,
      this.stock,
      this.purchasable,
      @JsonKey(name: 'price_before_discount') this.priceBeforeDiscount,
      this.price,
      final List<dynamic>? addons,
      final List<dynamic>? tags,
      final List<String>? media,
      @JsonKey(name: 'is_favorite') this.isFavorite,
      this.bogo,
      final List<String>? sizes})
      : _addons = addons,
        _tags = tags,
        _media = media,
        _sizes = sizes;
  factory _ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'vendor_id')
  final int? vendorId;
  @override
  @JsonKey(name: 'variant_id')
  final int? variantId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? sku;
  @override
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @override
  @JsonKey(name: 'quantity_increment')
  final int? quantityIncrement;
  @override
  @JsonKey(name: 'backorder_quantity')
  final int? backorderQuantity;
  @override
  final int? stock;
  @override
  final String? purchasable;
  @override
  @JsonKey(name: 'price_before_discount')
  final dynamic priceBeforeDiscount;
  @override
  final num? price;
  final List<dynamic>? _addons;
  @override
  List<dynamic>? get addons {
    final value = _addons;
    if (value == null) return null;
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _tags;
  @override
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _media;
  @override
  List<String>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @override
  final bool? bogo;
  final List<String>? _sizes;
  @override
  List<String>? get sizes {
    final value = _sizes;
    if (value == null) return null;
    if (_sizes is EqualUnmodifiableListView) return _sizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProductDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductDetailsModelCopyWith<_ProductDetailsModel> get copyWith =>
      __$ProductDetailsModelCopyWithImpl<_ProductDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDetailsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.backorderQuantity, backorderQuantity) ||
                other.backorderQuantity == backorderQuantity) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            const DeepCollectionEquality()
                .equals(other.priceBeforeDiscount, priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._addons, _addons) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.bogo, bogo) || other.bogo == bogo) &&
            const DeepCollectionEquality().equals(other._sizes, _sizes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        vendorId,
        variantId,
        name,
        description,
        sku,
        minQuantity,
        quantityIncrement,
        backorderQuantity,
        stock,
        purchasable,
        const DeepCollectionEquality().hash(priceBeforeDiscount),
        price,
        const DeepCollectionEquality().hash(_addons),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_media),
        isFavorite,
        bogo,
        const DeepCollectionEquality().hash(_sizes)
      ]);

  @override
  String toString() {
    return 'ProductDetailsModel(id: $id, vendorId: $vendorId, variantId: $variantId, name: $name, description: $description, sku: $sku, minQuantity: $minQuantity, quantityIncrement: $quantityIncrement, backorderQuantity: $backorderQuantity, stock: $stock, purchasable: $purchasable, priceBeforeDiscount: $priceBeforeDiscount, price: $price, addons: $addons, tags: $tags, media: $media, isFavorite: $isFavorite, bogo: $bogo, sizes: $sizes)';
  }
}

/// @nodoc
abstract mixin class _$ProductDetailsModelCopyWith<$Res>
    implements $ProductDetailsModelCopyWith<$Res> {
  factory _$ProductDetailsModelCopyWith(_ProductDetailsModel value,
          $Res Function(_ProductDetailsModel) _then) =
      __$ProductDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'vendor_id') int? vendorId,
      @JsonKey(name: 'variant_id') int? variantId,
      String? name,
      String? description,
      String? sku,
      @JsonKey(name: 'min_quantity') int? minQuantity,
      @JsonKey(name: 'quantity_increment') int? quantityIncrement,
      @JsonKey(name: 'backorder_quantity') int? backorderQuantity,
      int? stock,
      String? purchasable,
      @JsonKey(name: 'price_before_discount') dynamic priceBeforeDiscount,
      num? price,
      List<dynamic>? addons,
      List<dynamic>? tags,
      List<String>? media,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      bool? bogo,
      List<String>? sizes});
}

/// @nodoc
class __$ProductDetailsModelCopyWithImpl<$Res>
    implements _$ProductDetailsModelCopyWith<$Res> {
  __$ProductDetailsModelCopyWithImpl(this._self, this._then);

  final _ProductDetailsModel _self;
  final $Res Function(_ProductDetailsModel) _then;

  /// Create a copy of ProductDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? vendorId = freezed,
    Object? variantId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? sku = freezed,
    Object? minQuantity = freezed,
    Object? quantityIncrement = freezed,
    Object? backorderQuantity = freezed,
    Object? stock = freezed,
    Object? purchasable = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? addons = freezed,
    Object? tags = freezed,
    Object? media = freezed,
    Object? isFavorite = freezed,
    Object? bogo = freezed,
    Object? sizes = freezed,
  }) {
    return _then(_ProductDetailsModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _self.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      variantId: freezed == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _self.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      backorderQuantity: freezed == backorderQuantity
          ? _self.backorderQuantity
          : backorderQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      addons: freezed == addons
          ? _self._addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      media: freezed == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      bogo: freezed == bogo
          ? _self.bogo
          : bogo // ignore: cast_nullable_to_non_nullable
              as bool?,
      sizes: freezed == sizes
          ? _self._sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
