import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/models/location_item_model.dart';
import 'package:flutter_ecommerce_app/models/payment_card_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  Future<void> getCheckoutContent() async {
    emit(CheckoutLoading());
    try {
      final cartItems = dummyCart;
      double shippingValue = 10;
      final subtotal = cartItems.fold(
          0.0,
              (previousValue, element) =>
          previousValue + (element.product.price * element.quantity));
      final numOfProducts = cartItems.fold(
          0, (previousValue, element) => previousValue + element.quantity);

      final chosenPaymentCard = dummyPaymentCards.firstWhere(
            (card) => card.isChosen,
        orElse: () => dummyPaymentCards.first,
      );

      final chosenAddress = dummyLocations.firstWhere(
            (location) => location.isChosen,
        orElse: () => dummyLocations.first,
      );

      emit(
        CheckoutLoaded(
          cartItems: cartItems,
          totalAmount: subtotal + shippingValue,
          subtotal: subtotal,
          shippingValue: shippingValue,
          numOfProducts: numOfProducts,
          chosenPaymentCard: chosenPaymentCard,
          chosenAddress: chosenAddress,
        ),
      );
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
