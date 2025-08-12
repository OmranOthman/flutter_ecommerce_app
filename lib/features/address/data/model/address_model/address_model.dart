import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    int? id,
    String? title,
    String? country,
    String? state,
    @JsonKey(name: "line_one") String? lineOne,
    @JsonKey(name: "line_two") String? lineTwo,
    @JsonKey(name: "line_three") String? lineThree,
    String? city,
     @JsonKey(name: "contact_phone")
    String? contactPhone,
    String? landmark,
    String? location,
    String? floor,
    @JsonKey(name: "house_number") String? houseNumber,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "state_id") String? stateId,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
