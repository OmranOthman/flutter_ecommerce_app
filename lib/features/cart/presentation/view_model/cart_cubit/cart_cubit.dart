import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  //int quantity = 1;

  List<AddToCartModel> _cartItems = [...dummyCart];

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      emit(CartLoaded(_cartItems, _calculateSubtotal()));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void toggleItemSelection(String itemId, bool selected) {
    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(isSelected: selected);
      emit(CartLoaded(_cartItems, _calculateSubtotal()));
    }
  }

  double _calculateSubtotal() {
    return _cartItems.fold<double>(0, (sum, item) {
      return sum + (item.isSelected ? item.product.price * item.quantity : 0);
    });
  }

  Future<void> incrementCounter(AddToCartModel cartItem) async {
    try {
      emit(QuantityCounterLoading());

      final updatedQuantity = cartItem.quantity + 1;
      final updatedCartItem = cartItem.copyWith(quantity: updatedQuantity);

      _updateCartItem(updatedCartItem);
      emit(QuantityCounterLoaded(
        value: updatedQuantity,
        productId: updatedCartItem.product.id,
      ));
      emit(CartLoaded(_cartItems, _calculateSubtotal()));
    } catch (e) {
      emit(QuantityCounterError(e.toString()));
    }
  }

  Future<void> decrementCounter(AddToCartModel cartItem) async {
    try {
      if (cartItem.quantity <= 1) return;

      emit(QuantityCounterLoading());

      final updatedQuantity = cartItem.quantity - 1;
      final updatedCartItem = cartItem.copyWith(quantity: updatedQuantity);

      _updateCartItem(updatedCartItem);
      emit(QuantityCounterLoaded(
        value: updatedQuantity,
        productId: updatedCartItem.product.id,
      ));
      emit(CartLoaded(_cartItems, _calculateSubtotal()));
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
