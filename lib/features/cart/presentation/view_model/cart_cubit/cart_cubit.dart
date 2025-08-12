import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/entities/cart_total_entity.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/repositories/cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRepository cartRepository;
  CartCubit({required this.cartRepository}) : super(CartState.init());

  Future<void> getCart() async {
    emit(state.copyWith(isLoading: true));
    await cartRepository.getCartItems().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoading: false,
              errorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isLoading: false,
            cart: result.dataResponse,
          ));
        }
      },
    );
  }

  Future<void> getCartTotal() async {
    emit(state.copyWith(isLoadingCartTotal: true));
    await cartRepository.getCartTotal().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoadingCartTotal: false,
              errorMessageCartTotal: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isLoadingCartTotal: false,
            cartTotal: result.dataResponse,
          ));
        }
      },
    );
  }

  Future<void> deleteCart() async {
    emit(state.copyWith(deleteCartIsLoading: true));
    await cartRepository.deleteCart().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              deleteCartIsLoading: false,
              deleteCartErrorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            deleteCartIsLoading: false,
            cart: result.dataResponse,
          ));
        }
      },
    );
  }

  Future<void> deleteCartLine(
      {required int cartId, required int cartLineId}) async {
    emit(state.copyWith(deleteCartIsLoading: true));
    await cartRepository
        .deleteCartLine(
      cartId: cartId,
      cartLineId: cartLineId,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              deleteCartIsLoading: false,
              deleteCartErrorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
              deleteCartIsLoading: false,
              cart: result.dataResponse,
              deleteCartLineSuccess: true));
        }
      },
    );
  }

  Future<void> checkout({
    required int addressId,
    required String schedule,
    String? note,
  }) async {
    emit(state.copyWith(isLoadingCheckout: true));
    await cartRepository
        .createOrder(
            addressId: addressId,
            schedule: schedule,
            note: note,
            method: state.paymentMethod == PaymentMethod.cash ? 0 : 1)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoadingCheckout: false,
              errorMessageCheckout: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(isLoadingCheckout: false, checkoutSuccess: true));
        }
      },
    );
  }

  Future<void> increaseQuantity({
    required int cartId,
    required int cartLineId,
  }) async {
    emit(state.copyWith(isChangingQty: true));
    await cartRepository
        .incrementProductCart(
            cartId: cartId, cartLineId: cartLineId, quantity: 1)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isChangingQty: false,
              errorMessageChangingQty: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isChangingQty: false,
          ));
          getCartTotal();
        }
      },
    );
  }

  void decreaseQuantity({
    required int cartId,
    required int cartLineId,
  }) async {
    emit(state.copyWith(isChangingQty: true));
    await cartRepository
        .incrementProductCart(
            cartId: cartId, cartLineId: cartLineId, quantity: -1)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isChangingQty: false,
              errorMessageChangingQty: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isChangingQty: false,
          ));
          getCartTotal();
        }
      },
    );
  }

  void paymentMethodOnChanged(PaymentMethod paymentMethod) {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }
}
