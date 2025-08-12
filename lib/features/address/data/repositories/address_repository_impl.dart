import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/address/data/datasources/address_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';
import 'package:flutter_ecommerce_app/features/address/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRemoteDataSource addressRemoteDataSource;
  NetworkInfo networkInfo;
  AddressRepositoryImpl({
    required this.addressRemoteDataSource,
    required this.networkInfo,
  });
  List<AddressModel>? _addresses;
  List<StateModel>? _states;
  List<CountryModel>? _countries;
  @override
  Future<ApiResult<List<AddressModel>, Failure>> getAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        _addresses = await addressRemoteDataSource.fetchAddresses();
        return ApiResult.withSuccess(_addresses!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<AddressModel>, Failure>> addAddress(
      AddressModel address) async {
    if (await networkInfo.isConnected) {
      try {
        await addressRemoteDataSource.addAddress(address);
        return ApiResult.withSuccess(_addresses!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<AddressModel>, Failure>> deleteAddress(
      int addressId) async {
    if (await networkInfo.isConnected) {
      try {
        await addressRemoteDataSource.deleteAddress(addressId);
        int index =
            _addresses!.indexWhere((address) => address.id == addressId);

        if (index != -1) {
          _addresses!.removeAt(index);
        }
        return ApiResult.withSuccess(_addresses!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<CountryModel>, Failure>> getCountries() async {
    if (await networkInfo.isConnected) {
      try {
        _countries = await addressRemoteDataSource.fetchCountries();
        return ApiResult.withSuccess(_countries!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<StateModel>, Failure>> getStates(int countryId) async {
    if (await networkInfo.isConnected) {
      try {
        _states = await addressRemoteDataSource.fetchStates(countryId);
        return ApiResult.withSuccess(_states!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }
}
