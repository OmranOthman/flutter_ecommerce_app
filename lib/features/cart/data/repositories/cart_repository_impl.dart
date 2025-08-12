import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/cart/data/datacources/cart_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_line_model.dart/cart_lines_model.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/entities/cart_total_entity.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.cartRemoteDataSource,
    required this.networkInfo,
  });
  List<CartModel>? _cart;
  CartTotalEntity? _cartTotalEntity;
  @override
  Future<ApiResult<List<CartModel>, Failure>> getCartItems() async {
    if (await networkInfo.isConnected) {
      try {
        _cart = await cartRemoteDataSource.getCartItems();

        return ApiResult.withSuccess(_cart!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    } else {
      return ApiResult.withError(InternetConnectionFailure());
    }
  }

  @override
  Future<ApiResult<CartTotalEntity, Failure>> getCartTotal() async {
    if (await networkInfo.isConnected) {
      try {
        _cartTotalEntity = await cartRemoteDataSource.getCartTotal();
        return ApiResult.withSuccess(_cartTotalEntity!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    } else {
      return ApiResult.withError(InternetConnectionFailure());
    }
  }

  @override
  Future<ApiResult<List<CartModel>, Failure>> deleteCart() async {
    if (await networkInfo.isConnected) {
      try {
        await cartRemoteDataSource.deleteCart();
        _cart!.clear();
        return ApiResult.withSuccess(_cart!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<CartModel>, Failure>> deleteCartLine({
    required int cartId,
    required int cartLineId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await cartRemoteDataSource.deleteCartLine(cartLineId);
        int? cartIndex = _cart?.indexWhere((cart) => cart.id == cartId);
        if (cartIndex != null && cartIndex != -1) {
          List<CartModel> updatedCart = List.from(_cart!);
          CartModel cart = updatedCart[cartIndex];
          List<CartLinesModel>? updatedCartLines = cart.cartLines != null
              ? List.from(
                  cart.cartLines!.where((item) => item.id != cartLineId))
              : null;
          CartModel updatedCartModel =
              cart.copyWith(cartLines: updatedCartLines);
          updatedCart[cartIndex] = updatedCartModel;
          if (updatedCartLines == null || updatedCartLines.isEmpty) {
            updatedCart.removeAt(cartIndex);
          }
          _cart = updatedCart;
        }
        return ApiResult.withSuccess(_cart!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        print("what is the $error");
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<CartModel>, Failure>> incrementProductCart({
    required int cartId,
    required int cartLineId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await cartRemoteDataSource.incrementProductCart(
            cartLineId: cartLineId, quantity: quantity);
        int? cartIndex = _cart?.indexWhere((cart) => cart.id == cartId);

        if (cartIndex != null && cartIndex != -1) {
          CartModel cart = _cart![cartIndex];

          int? cartLineIndex =
              cart.cartLines?.indexWhere((line) => line.id == cartLineId);

          if (cartLineIndex != null && cartLineIndex != -1) {
            CartLinesModel cartLine = cart.cartLines![cartLineIndex];

            CartLinesModel updatedCartLine =
                cartLine.copyWith(quantity: cartLine.quantity! + quantity);

            final updatedCartLines = List<CartLinesModel>.from(cart.cartLines!)
              ..[cartLineIndex] = updatedCartLine;

            final updatedCart = cart.copyWith(cartLines: updatedCartLines);
            _cart![cartIndex] = updatedCart;
          }
        }
        return ApiResult.withSuccess(_cart!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> updateNote(
      {required int cartLineId, required String note}) async {
    if (await networkInfo.isConnected) {
      try {
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> createOrder({
    required int addressId,
    required String schedule,
    required int method,
    String? note,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await cartRemoteDataSource.createOrder(
          addressId: addressId,
          method: method,
          schedule: schedule,
          note: note,
        );
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }
}
