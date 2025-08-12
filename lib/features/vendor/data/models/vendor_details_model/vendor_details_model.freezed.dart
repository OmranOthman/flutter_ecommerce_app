// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorDetailsModel {
  int? get id;
  String? get name;
  String? get description;
  @JsonKey(name: 'legal_name')
  String? get legalName;
  String? get phone;
  @JsonKey(name: 'payment_methods')
  List<String>? get paymentMethods;
  @JsonKey(name: 'min_order')
  int? get minOrder;
  List<dynamic>? get discounts;
  String? get collection;
  Map<String, dynamic>? get location;
  List<dynamic>? get services;
  @JsonKey(name: 'categories_show_type')
  String? get categoriesShowType;
  @JsonKey(name: 'products_show_type')
  String? get productsShowType;
  List<String>? get cuisines;
  @JsonKey(name: 'is_open')
  bool? get isOpen;
  @JsonKey(name: 'opening_hours_today')
  List<dynamic>? get openingHoursToday;
  @JsonKey(name: 'brand_image')
  String? get brandImage;
  List<String>? get media;
  List<CategoryModel>? get categories;
  List<dynamic>? get tags;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;

  /// Create a copy of VendorDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VendorDetailsModelCopyWith<VendorDetailsModel> get copyWith =>
      _$VendorDetailsModelCopyWithImpl<VendorDetailsModel>(
          this as VendorDetailsModel, _$identity);

  /// Serializes this VendorDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VendorDetailsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.legalName, legalName) ||
                other.legalName == legalName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethods, paymentMethods) &&
            (identical(other.minOrder, minOrder) ||
                other.minOrder == minOrder) &&
            const DeepCollectionEquality().equals(other.discounts, discounts) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            (identical(other.categoriesShowType, categoriesShowType) ||
                other.categoriesShowType == categoriesShowType) &&
            (identical(other.productsShowType, productsShowType) ||
                other.productsShowType == productsShowType) &&
            const DeepCollectionEquality().equals(other.cuisines, cuisines) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            const DeepCollectionEquality()
                .equals(other.openingHoursToday, openingHoursToday) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        legalName,
        phone,
        const DeepCollectionEquality().hash(paymentMethods),
        minOrder,
        const DeepCollectionEquality().hash(discounts),
        collection,
        const DeepCollectionEquality().hash(location),
        const DeepCollectionEquality().hash(services),
        categoriesShowType,
        productsShowType,
        const DeepCollectionEquality().hash(cuisines),
        isOpen,
        const DeepCollectionEquality().hash(openingHoursToday),
        brandImage,
        const DeepCollectionEquality().hash(media),
        const DeepCollectionEquality().hash(categories),
        const DeepCollectionEquality().hash(tags),
        isFavorite
      ]);

  @override
  String toString() {
    return 'VendorDetailsModel(id: $id, name: $name, description: $description, legalName: $legalName, phone: $phone, paymentMethods: $paymentMethods, minOrder: $minOrder, discounts: $discounts, collection: $collection, location: $location, services: $services, categoriesShowType: $categoriesShowType, productsShowType: $productsShowType, cuisines: $cuisines, isOpen: $isOpen, openingHoursToday: $openingHoursToday, brandImage: $brandImage, media: $media, categories: $categories, tags: $tags, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $VendorDetailsModelCopyWith<$Res> {
  factory $VendorDetailsModelCopyWith(
          VendorDetailsModel value, $Res Function(VendorDetailsModel) _then) =
      _$VendorDetailsModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      @JsonKey(name: 'legal_name') String? legalName,
      String? phone,
      @JsonKey(name: 'payment_methods') List<String>? paymentMethods,
      @JsonKey(name: 'min_order') int? minOrder,
      List<dynamic>? discounts,
      String? collection,
      Map<String, dynamic>? location,
      List<dynamic>? services,
      @JsonKey(name: 'categories_show_type') String? categoriesShowType,
      @JsonKey(name: 'products_show_type') String? productsShowType,
      List<String>? cuisines,
      @JsonKey(name: 'is_open') bool? isOpen,
      @JsonKey(name: 'opening_hours_today') List<dynamic>? openingHoursToday,
      @JsonKey(name: 'brand_image') String? brandImage,
      List<String>? media,
      List<CategoryModel>? categories,
      List<dynamic>? tags,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class _$VendorDetailsModelCopyWithImpl<$Res>
    implements $VendorDetailsModelCopyWith<$Res> {
  _$VendorDetailsModelCopyWithImpl(this._self, this._then);

  final VendorDetailsModel _self;
  final $Res Function(VendorDetailsModel) _then;

  /// Create a copy of VendorDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? legalName = freezed,
    Object? phone = freezed,
    Object? paymentMethods = freezed,
    Object? minOrder = freezed,
    Object? discounts = freezed,
    Object? collection = freezed,
    Object? location = freezed,
    Object? services = freezed,
    Object? categoriesShowType = freezed,
    Object? productsShowType = freezed,
    Object? cuisines = freezed,
    Object? isOpen = freezed,
    Object? openingHoursToday = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? isFavorite = freezed,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      legalName: freezed == legalName
          ? _self.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethods: freezed == paymentMethods
          ? _self.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minOrder: freezed == minOrder
          ? _self.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      discounts: freezed == discounts
          ? _self.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      collection: freezed == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      services: freezed == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      categoriesShowType: freezed == categoriesShowType
          ? _self.categoriesShowType
          : categoriesShowType // ignore: cast_nullable_to_non_nullable
              as String?,
      productsShowType: freezed == productsShowType
          ? _self.productsShowType
          : productsShowType // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisines: freezed == cuisines
          ? _self.cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      openingHoursToday: freezed == openingHoursToday
          ? _self.openingHoursToday
          : openingHoursToday // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: freezed == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VendorDetailsModel implements VendorDetailsModel {
  const _VendorDetailsModel(
      {this.id,
      this.name,
      this.description,
      @JsonKey(name: 'legal_name') this.legalName,
      this.phone,
      @JsonKey(name: 'payment_methods') final List<String>? paymentMethods,
      @JsonKey(name: 'min_order') this.minOrder,
      final List<dynamic>? discounts,
      this.collection,
      final Map<String, dynamic>? location,
      final List<dynamic>? services,
      @JsonKey(name: 'categories_show_type') this.categoriesShowType,
      @JsonKey(name: 'products_show_type') this.productsShowType,
      final List<String>? cuisines,
      @JsonKey(name: 'is_open') this.isOpen,
      @JsonKey(name: 'opening_hours_today')
      final List<dynamic>? openingHoursToday,
      @JsonKey(name: 'brand_image') this.brandImage,
      final List<String>? media,
      final List<CategoryModel>? categories,
      final List<dynamic>? tags,
      @JsonKey(name: 'is_favorite') this.isFavorite})
      : _paymentMethods = paymentMethods,
        _discounts = discounts,
        _location = location,
        _services = services,
        _cuisines = cuisines,
        _openingHoursToday = openingHoursToday,
        _media = media,
        _categories = categories,
        _tags = tags;
  factory _VendorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'legal_name')
  final String? legalName;
  @override
  final String? phone;
  final List<String>? _paymentMethods;
  @override
  @JsonKey(name: 'payment_methods')
  List<String>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'min_order')
  final int? minOrder;
  final List<dynamic>? _discounts;
  @override
  List<dynamic>? get discounts {
    final value = _discounts;
    if (value == null) return null;
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? collection;
  final Map<String, dynamic>? _location;
  @override
  Map<String, dynamic>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableMapView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<dynamic>? _services;
  @override
  List<dynamic>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'categories_show_type')
  final String? categoriesShowType;
  @override
  @JsonKey(name: 'products_show_type')
  final String? productsShowType;
  final List<String>? _cuisines;
  @override
  List<String>? get cuisines {
    final value = _cuisines;
    if (value == null) return null;
    if (_cuisines is EqualUnmodifiableListView) return _cuisines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_open')
  final bool? isOpen;
  final List<dynamic>? _openingHoursToday;
  @override
  @JsonKey(name: 'opening_hours_today')
  List<dynamic>? get openingHoursToday {
    final value = _openingHoursToday;
    if (value == null) return null;
    if (_openingHoursToday is EqualUnmodifiableListView)
      return _openingHoursToday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'brand_image')
  final String? brandImage;
  final List<String>? _media;
  @override
  List<String>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoryModel>? _categories;
  @override
  List<CategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
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

  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  /// Create a copy of VendorDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VendorDetailsModelCopyWith<_VendorDetailsModel> get copyWith =>
      __$VendorDetailsModelCopyWithImpl<_VendorDetailsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VendorDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VendorDetailsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.legalName, legalName) ||
                other.legalName == legalName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.minOrder, minOrder) ||
                other.minOrder == minOrder) &&
            const DeepCollectionEquality()
                .equals(other._discounts, _discounts) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.categoriesShowType, categoriesShowType) ||
                other.categoriesShowType == categoriesShowType) &&
            (identical(other.productsShowType, productsShowType) ||
                other.productsShowType == productsShowType) &&
            const DeepCollectionEquality().equals(other._cuisines, _cuisines) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            const DeepCollectionEquality()
                .equals(other._openingHoursToday, _openingHoursToday) &&
            (identical(other.brandImage, brandImage) ||
                other.brandImage == brandImage) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        legalName,
        phone,
        const DeepCollectionEquality().hash(_paymentMethods),
        minOrder,
        const DeepCollectionEquality().hash(_discounts),
        collection,
        const DeepCollectionEquality().hash(_location),
        const DeepCollectionEquality().hash(_services),
        categoriesShowType,
        productsShowType,
        const DeepCollectionEquality().hash(_cuisines),
        isOpen,
        const DeepCollectionEquality().hash(_openingHoursToday),
        brandImage,
        const DeepCollectionEquality().hash(_media),
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_tags),
        isFavorite
      ]);

  @override
  String toString() {
    return 'VendorDetailsModel(id: $id, name: $name, description: $description, legalName: $legalName, phone: $phone, paymentMethods: $paymentMethods, minOrder: $minOrder, discounts: $discounts, collection: $collection, location: $location, services: $services, categoriesShowType: $categoriesShowType, productsShowType: $productsShowType, cuisines: $cuisines, isOpen: $isOpen, openingHoursToday: $openingHoursToday, brandImage: $brandImage, media: $media, categories: $categories, tags: $tags, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class _$VendorDetailsModelCopyWith<$Res>
    implements $VendorDetailsModelCopyWith<$Res> {
  factory _$VendorDetailsModelCopyWith(
          _VendorDetailsModel value, $Res Function(_VendorDetailsModel) _then) =
      __$VendorDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      @JsonKey(name: 'legal_name') String? legalName,
      String? phone,
      @JsonKey(name: 'payment_methods') List<String>? paymentMethods,
      @JsonKey(name: 'min_order') int? minOrder,
      List<dynamic>? discounts,
      String? collection,
      Map<String, dynamic>? location,
      List<dynamic>? services,
      @JsonKey(name: 'categories_show_type') String? categoriesShowType,
      @JsonKey(name: 'products_show_type') String? productsShowType,
      List<String>? cuisines,
      @JsonKey(name: 'is_open') bool? isOpen,
      @JsonKey(name: 'opening_hours_today') List<dynamic>? openingHoursToday,
      @JsonKey(name: 'brand_image') String? brandImage,
      List<String>? media,
      List<CategoryModel>? categories,
      List<dynamic>? tags,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class __$VendorDetailsModelCopyWithImpl<$Res>
    implements _$VendorDetailsModelCopyWith<$Res> {
  __$VendorDetailsModelCopyWithImpl(this._self, this._then);

  final _VendorDetailsModel _self;
  final $Res Function(_VendorDetailsModel) _then;

  /// Create a copy of VendorDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? legalName = freezed,
    Object? phone = freezed,
    Object? paymentMethods = freezed,
    Object? minOrder = freezed,
    Object? discounts = freezed,
    Object? collection = freezed,
    Object? location = freezed,
    Object? services = freezed,
    Object? categoriesShowType = freezed,
    Object? productsShowType = freezed,
    Object? cuisines = freezed,
    Object? isOpen = freezed,
    Object? openingHoursToday = freezed,
    Object? brandImage = freezed,
    Object? media = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_VendorDetailsModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      legalName: freezed == legalName
          ? _self.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethods: freezed == paymentMethods
          ? _self._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minOrder: freezed == minOrder
          ? _self.minOrder
          : minOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      discounts: freezed == discounts
          ? _self._discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      collection: freezed == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self._location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      services: freezed == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      categoriesShowType: freezed == categoriesShowType
          ? _self.categoriesShowType
          : categoriesShowType // ignore: cast_nullable_to_non_nullable
              as String?,
      productsShowType: freezed == productsShowType
          ? _self.productsShowType
          : productsShowType // ignore: cast_nullable_to_non_nullable
              as String?,
      cuisines: freezed == cuisines
          ? _self._cuisines
          : cuisines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      openingHoursToday: freezed == openingHoursToday
          ? _self._openingHoursToday
          : openingHoursToday // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      brandImage: freezed == brandImage
          ? _self.brandImage
          : brandImage // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: freezed == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isFavorite: freezed == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
