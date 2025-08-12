// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {
  int? get id;
  String? get title;
  String? get country;
  String? get state;
  @JsonKey(name: "line_one")
  String? get lineOne;
  @JsonKey(name: "line_two")
  String? get lineTwo;
  @JsonKey(name: "line_three")
  String? get lineThree;
  String? get city;
  @JsonKey(name: "contact_phone")
  String? get contactPhone;
  String? get landmark;
  String? get location;
  String? get floor;
  @JsonKey(name: "house_number")
  String? get houseNumber;
  @JsonKey(name: "country_id")
  String? get countryId;
  @JsonKey(name: "state_id")
  String? get stateId;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<AddressModel> get copyWith =>
      _$AddressModelCopyWithImpl<AddressModel>(
          this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.lineOne, lineOne) || other.lineOne == lineOne) &&
            (identical(other.lineTwo, lineTwo) || other.lineTwo == lineTwo) &&
            (identical(other.lineThree, lineThree) ||
                other.lineThree == lineThree) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      country,
      state,
      lineOne,
      lineTwo,
      lineThree,
      city,
      contactPhone,
      landmark,
      location,
      floor,
      houseNumber,
      countryId,
      stateId);

  @override
  String toString() {
    return 'AddressModel(id: $id, title: $title, country: $country, state: $state, lineOne: $lineOne, lineTwo: $lineTwo, lineThree: $lineThree, city: $city, contactPhone: $contactPhone, landmark: $landmark, location: $location, floor: $floor, houseNumber: $houseNumber, countryId: $countryId, stateId: $stateId)';
  }
}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) _then) =
      _$AddressModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? country,
      String? state,
      @JsonKey(name: "line_one") String? lineOne,
      @JsonKey(name: "line_two") String? lineTwo,
      @JsonKey(name: "line_three") String? lineThree,
      String? city,
      @JsonKey(name: "contact_phone") String? contactPhone,
      String? landmark,
      String? location,
      String? floor,
      @JsonKey(name: "house_number") String? houseNumber,
      @JsonKey(name: "country_id") String? countryId,
      @JsonKey(name: "state_id") String? stateId});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? lineOne = freezed,
    Object? lineTwo = freezed,
    Object? lineThree = freezed,
    Object? city = freezed,
    Object? contactPhone = freezed,
    Object? landmark = freezed,
    Object? location = freezed,
    Object? floor = freezed,
    Object? houseNumber = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
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
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lineOne: freezed == lineOne
          ? _self.lineOne
          : lineOne // ignore: cast_nullable_to_non_nullable
              as String?,
      lineTwo: freezed == lineTwo
          ? _self.lineTwo
          : lineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      lineThree: freezed == lineThree
          ? _self.lineThree
          : lineThree // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _self.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _self.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _self.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddressModel implements AddressModel {
  const _AddressModel(
      {this.id,
      this.title,
      this.country,
      this.state,
      @JsonKey(name: "line_one") this.lineOne,
      @JsonKey(name: "line_two") this.lineTwo,
      @JsonKey(name: "line_three") this.lineThree,
      this.city,
      @JsonKey(name: "contact_phone") this.contactPhone,
      this.landmark,
      this.location,
      this.floor,
      @JsonKey(name: "house_number") this.houseNumber,
      @JsonKey(name: "country_id") this.countryId,
      @JsonKey(name: "state_id") this.stateId});
  factory _AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? country;
  @override
  final String? state;
  @override
  @JsonKey(name: "line_one")
  final String? lineOne;
  @override
  @JsonKey(name: "line_two")
  final String? lineTwo;
  @override
  @JsonKey(name: "line_three")
  final String? lineThree;
  @override
  final String? city;
  @override
  @JsonKey(name: "contact_phone")
  final String? contactPhone;
  @override
  final String? landmark;
  @override
  final String? location;
  @override
  final String? floor;
  @override
  @JsonKey(name: "house_number")
  final String? houseNumber;
  @override
  @JsonKey(name: "country_id")
  final String? countryId;
  @override
  @JsonKey(name: "state_id")
  final String? stateId;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.lineOne, lineOne) || other.lineOne == lineOne) &&
            (identical(other.lineTwo, lineTwo) || other.lineTwo == lineTwo) &&
            (identical(other.lineThree, lineThree) ||
                other.lineThree == lineThree) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      country,
      state,
      lineOne,
      lineTwo,
      lineThree,
      city,
      contactPhone,
      landmark,
      location,
      floor,
      houseNumber,
      countryId,
      stateId);

  @override
  String toString() {
    return 'AddressModel(id: $id, title: $title, country: $country, state: $state, lineOne: $lineOne, lineTwo: $lineTwo, lineThree: $lineThree, city: $city, contactPhone: $contactPhone, landmark: $landmark, location: $location, floor: $floor, houseNumber: $houseNumber, countryId: $countryId, stateId: $stateId)';
  }
}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) _then) =
      __$AddressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? country,
      String? state,
      @JsonKey(name: "line_one") String? lineOne,
      @JsonKey(name: "line_two") String? lineTwo,
      @JsonKey(name: "line_three") String? lineThree,
      String? city,
      @JsonKey(name: "contact_phone") String? contactPhone,
      String? landmark,
      String? location,
      String? floor,
      @JsonKey(name: "house_number") String? houseNumber,
      @JsonKey(name: "country_id") String? countryId,
      @JsonKey(name: "state_id") String? stateId});
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? lineOne = freezed,
    Object? lineTwo = freezed,
    Object? lineThree = freezed,
    Object? city = freezed,
    Object? contactPhone = freezed,
    Object? landmark = freezed,
    Object? location = freezed,
    Object? floor = freezed,
    Object? houseNumber = freezed,
    Object? countryId = freezed,
    Object? stateId = freezed,
  }) {
    return _then(_AddressModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lineOne: freezed == lineOne
          ? _self.lineOne
          : lineOne // ignore: cast_nullable_to_non_nullable
              as String?,
      lineTwo: freezed == lineTwo
          ? _self.lineTwo
          : lineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      lineThree: freezed == lineThree
          ? _self.lineThree
          : lineThree // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _self.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _self.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _self.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
