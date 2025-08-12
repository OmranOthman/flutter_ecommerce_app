import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AddressRemoteDataSource {
  Future<void> addAddress(AddressModel addressModel);

  Future<void> deleteAddress(int addressId);

  Future<List<AddressModel>> fetchAddresses();

  Future<List<CountryModel>> fetchCountries();

  Future<List<StateModel>> fetchStates(int countryId);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  AddressRemoteDataSourceImpl(
      {required this.dio, required this.sharedPreferences});

  String? get token => sharedPreferences.getString(AppString.token);

  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<List<AddressModel>> fetchAddresses() async {
    Response response = await dio.get(
      "${AppString.apiUrl}profile/addresses",
      options: Options(headers: {
        "Authorization": "Bearer $token",
        "Accept-Language": language
      }),
    );
    if (response.statusCode == 200 && response.data['data'] != null) {
      final List list = response.data['data'];
      return list.map((e) => AddressModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addAddress(AddressModel addressModel) async {
    Response result = await dio.post(
      "${AppString.apiUrl}profile/address",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: addressModel.toJson(),
    );
    if (result.statusCode == 201) {
      return;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteAddress(int addressId) async {
    Response result = await dio.delete(
      "${AppString.apiUrl}profile/address/$addressId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (result.statusCode == 200) {
      return;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CountryModel>> fetchCountries() async {
    Response response = await dio.get(
      "${AppString.apiUrl}countries",
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );

    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((json) => CountryModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<StateModel>> fetchStates(int countryId) async {
    Response response = await dio.get(
      "${AppString.apiUrl}states/$countryId",
      options: Options(
        headers: {"Accept-Language": language},
      ),
    );
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((json) => StateModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
