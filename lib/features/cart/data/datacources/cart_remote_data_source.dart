import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_total_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CartRemoteDataSource {
  Future<List<CartModel>> getCartItems();

  Future<CartTotalModel> getCartTotal();


  Future<void> deleteCart();

  Future<void> deleteCartLine(int cartLineId);

  Future<void> updateNote({
    required int cartLineId,
    required String note,
  });

  Future<void> incrementProductCart({
    required int cartLineId,
    required int quantity,
  });

  Future<void> createOrder({
    required int addressId,
    required String schedule,
    required int method,
    String? note,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;
  SharedPreferences sharedPreferences;

  CartRemoteDataSourceImpl({
    required this.sharedPreferences,
    required this.dio,
  });

  String? get token => sharedPreferences.getString(AppString.token);

  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<List<CartModel>> getCartItems() async {
    Response response = await dio.get(
      "${AppString.apiUrl}cart",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map(
            (json) => CartModel.fromJson(json),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartTotalModel> getCartTotal() async {
    Response response = await dio.get(
      "${AppString.apiUrl}cart-total",
      options: Options(
        headers: {"Authorization": "Bearer $token", "Accept-Language": language},
      ),
    );
    if (response.statusCode == 200) {
      return CartTotalModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }


  @override
  Future<void> updateNote({
    required int cartLineId,
    required String note,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}cart/$cartLineId/note",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: {
        "note": note,
      },
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> incrementProductCart({
    required int cartLineId,
    required int quantity,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}cart/$cartLineId/increment",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: {
        "quantity": quantity,
      },
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> deleteCart() async {
    Response response = await dio.post(
      "${AppString.apiUrl}delete-cart",
      options: Options(
        headers: {"Authorization": "Bearer $token", "Accept-Language": language},
      ),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> deleteCartLine(int cartLineId) async {
    Response response = await dio.post(
      "${AppString.apiUrl}clear-cartLine/$cartLineId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      // queryParameters: {
      //   "cartLine": cartLineId,
      // },
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> createOrder({
    required int addressId,
    required String schedule,
    required int method,
    String? note,
  }) async {
    Response response = await dio.post("${AppString.apiUrl}order",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept-Language": language
          },
        ),
        queryParameters: {
          "service": 0,
          "channel": "app",
          "address_id": addressId,
          "method": method,
          "notes": note,
          "schedule": schedule,
        });
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }
}
