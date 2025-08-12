import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';

abstract interface class AddressRepository {
  Future<ApiResult<List<AddressModel>, Failure>> getAddresses();
  Future<ApiResult<List<AddressModel>, Failure>> deleteAddress(int addressId);
  Future<ApiResult<List<AddressModel>, Failure>> addAddress(
      AddressModel address);
  Future<ApiResult<List<CountryModel>, Failure>> getCountries();
  Future<ApiResult<List<StateModel>, Failure>> getStates(int countryId);
}
