import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int quantity = 1;

  List<AddToCartModel> _cartItems = [...dummyCart];

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      emit(CartLoaded(_cartItems, _subtotal(_cartItems)));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> incrementCounter(AddToCartModel cartItem, [int? initialValue]) async {
    if (initialValue != null) {
      quantity = initialValue;
    }
    quantity++;
    try {
      emit(QuantityCounterLoading());
      final updatedCartItem = cartItem.copyWith(quantity: quantity);
      _updateCartItem(updatedCartItem);
      emit(QuantityCounterLoaded(
        value: quantity,
        productId: updatedCartItem.product.id,
      ));
      emit(SubtotalUpdated(_subtotal(_cartItems)));
    } catch (e) {
      emit(QuantityCounterError(e.toString()));
    }
  }

  Future<void> decrementCounter(AddToCartModel cartItem, [int? initialValue]) async {
    if (initialValue != null) {
      quantity = initialValue;
    }
    if (quantity > 1) quantity--;
    try {
      emit(QuantityCounterLoading());
      final updatedCartItem = cartItem.copyWith(quantity: quantity);
      _updateCartItem(updatedCartItem);
      emit(QuantityCounterLoaded(
        value: quantity,
        productId: updatedCartItem.product.id,
      ));
      emit(SubtotalUpdated(_subtotal(_cartItems)));
    } catch (e) {
      emit(QuantityCounterError(e.toString()));
    }
  }

  void _updateCartItem(AddToCartModel updatedItem) {
    final index = _cartItems.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      _cartItems[index] = updatedItem;
    }
  }

  double _subtotal(List<AddToCartModel> cartItems) => cartItems.fold<double>(
      0,
          (previousValue, item) =>
      previousValue + (item.product.price * item.quantity));
}
