// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {
  int? get id;
  @JsonKey(name: 'variant_id')
  int? get variantId;
  String? get name;
  String? get description;
  @JsonKey(name: 'category_id')
  int? get categoryId;
  String? get media;
  @JsonKey(name: 'price_before_discount')
  double? get priceBeforeDiscount;
  double? get price;
  int? get stock;
  @JsonKey(name: 'quantity_increment')
  int? get quantityIncrement;
  String? get purchasable;
  int? get backorder;
  @JsonKey(name: 'min_quantity')
  int? get minQuantity;
  @JsonKey(name: 'has_addon')
  bool? get hasAddon;
  bool? get bogo;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.priceBeforeDiscount, priceBeforeDiscount) ||
                other.priceBeforeDiscount == priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            (identical(other.backorder, backorder) ||
                other.backorder == backorder) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.hasAddon, hasAddon) ||
                other.hasAddon == hasAddon) &&
            (identical(other.bogo, bogo) || other.bogo == bogo) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      variantId,
      name,
      description,
      categoryId,
      media,
      priceBeforeDiscount,
      price,
      stock,
      quantityIncrement,
      purchasable,
      backorder,
      minQuantity,
      hasAddon,
      bogo,
      isFavorite);

  @override
  String toString() {
    return 'ProductModel(id: $id, variantId: $variantId, name: $name, description: $description, categoryId: $categoryId, media: $media, priceBeforeDiscount: $priceBeforeDiscount, price: $price, stock: $stock, quantityIncrement: $quantityIncrement, purchasable: $purchasable, backorder: $backorder, minQuantity: $minQuantity, hasAddon: $hasAddon, bogo: $bogo, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'variant_id') int? variantId,
      String? name,
      String? description,
      @JsonKey(name: 'category_id') int? categoryId,
      String? media,
      @JsonKey(name: 'price_before_discount') double? priceBeforeDiscount,
      double? price,
      int? stock,
      @JsonKey(name: 'quantity_increment') int? quantityIncrement,
      String? purchasable,
      int? backorder,
      @JsonKey(name: 'min_quantity') int? minQuantity,
      @JsonKey(name: 'has_addon') bool? hasAddon,
      bool? bogo,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? variantId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? media = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? quantityIncrement = freezed,
    Object? purchasable = freezed,
    Object? backorder = freezed,
    Object? minQuantity = freezed,
    Object? hasAddon = freezed,
    Object? bogo = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      backorder: freezed == backorder
          ? _self.backorder
          : backorder // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAddon: freezed == hasAddon
          ? _self.hasAddon
          : hasAddon // ignore: cast_nullable_to_non_nullable
              as bool?,
      bogo: freezed == bogo
          ? _self.bogo
          : bogo // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductModel implements ProductModel {
  _ProductModel(
      {this.id,
      @JsonKey(name: 'variant_id') this.variantId,
      this.name,
      this.description,
      @JsonKey(name: 'category_id') this.categoryId,
      this.media,
      @JsonKey(name: 'price_before_discount') this.priceBeforeDiscount,
      this.price,
      this.stock,
      @JsonKey(name: 'quantity_increment') this.quantityIncrement,
      this.purchasable,
      this.backorder,
      @JsonKey(name: 'min_quantity') this.minQuantity,
      @JsonKey(name: 'has_addon') this.hasAddon,
      this.bogo,
      @JsonKey(name: 'is_favorite') this.isFavorite});
  factory _ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'variant_id')
  final int? variantId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  final String? media;
  @override
  @JsonKey(name: 'price_before_discount')
  final double? priceBeforeDiscount;
  @override
  final double? price;
  @override
  final int? stock;
  @override
  @JsonKey(name: 'quantity_increment')
  final int? quantityIncrement;
  @override
  final String? purchasable;
  @override
  final int? backorder;
  @override
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @override
  @JsonKey(name: 'has_addon')
  final bool? hasAddon;
  @override
  final bool? bogo;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.priceBeforeDiscount, priceBeforeDiscount) ||
                other.priceBeforeDiscount == priceBeforeDiscount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantityIncrement, quantityIncrement) ||
                other.quantityIncrement == quantityIncrement) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            (identical(other.backorder, backorder) ||
                other.backorder == backorder) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.hasAddon, hasAddon) ||
                other.hasAddon == hasAddon) &&
            (identical(other.bogo, bogo) || other.bogo == bogo) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      variantId,
      name,
      description,
      categoryId,
      media,
      priceBeforeDiscount,
      price,
      stock,
      quantityIncrement,
      purchasable,
      backorder,
      minQuantity,
      hasAddon,
      bogo,
      isFavorite);

  @override
  String toString() {
    return 'ProductModel(id: $id, variantId: $variantId, name: $name, description: $description, categoryId: $categoryId, media: $media, priceBeforeDiscount: $priceBeforeDiscount, price: $price, stock: $stock, quantityIncrement: $quantityIncrement, purchasable: $purchasable, backorder: $backorder, minQuantity: $minQuantity, hasAddon: $hasAddon, bogo: $bogo, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'variant_id') int? variantId,
      String? name,
      String? description,
      @JsonKey(name: 'category_id') int? categoryId,
      String? media,
      @JsonKey(name: 'price_before_discount') double? priceBeforeDiscount,
      double? price,
      int? stock,
      @JsonKey(name: 'quantity_increment') int? quantityIncrement,
      String? purchasable,
      int? backorder,
      @JsonKey(name: 'min_quantity') int? minQuantity,
      @JsonKey(name: 'has_addon') bool? hasAddon,
      bool? bogo,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? variantId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? media = freezed,
    Object? priceBeforeDiscount = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? quantityIncrement = freezed,
    Object? purchasable = freezed,
    Object? backorder = freezed,
    Object? minQuantity = freezed,
    Object? hasAddon = freezed,
    Object? bogo = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_ProductModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBeforeDiscount: freezed == priceBeforeDiscount
          ? _self.priceBeforeDiscount
          : priceBeforeDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityIncrement: freezed == quantityIncrement
          ? _self.quantityIncrement
          : quantityIncrement // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasable: freezed == purchasable
          ? _self.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as String?,
      backorder: freezed == backorder
          ? _self.backorder
          : backorder // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _self.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAddon: freezed == hasAddon
          ? _self.hasAddon
          : hasAddon // ignore: cast_nullable_to_non_nullable
              as bool?,
      bogo: freezed == bogo
          ? _self.bogo
          : bogo // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
