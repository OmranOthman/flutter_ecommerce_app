part of 'cart_cubit.dart';

class CartState extends Equatable {
  final bool isLoading;
  final bool deleteCartIsLoading;
  final bool isLoadingCartTotal;
  final bool isChangingQty;
  final String? errorMessageChangingQty;
  final String? errorMessage;
  final String? errorMessageCartTotal;
  final String? deleteCartErrorMessage;
  final bool isLoadingCheckout;
  final String? errorMessageCheckout;
  final List<CartModel>? cart;
  final CartTotalEntity? cartTotal;
  final bool checkoutSuccess;
  final bool deleteCartLineSuccess;
  final PaymentMethod paymentMethod;

  CartState({
    List<CartModel>? cart,
    this.deleteCartErrorMessage,
    this.deleteCartIsLoading = false,
    this.errorMessage,
    this.cartTotal,
    this.isLoadingCartTotal = false,
    this.isLoading = false,
    this.isChangingQty = false,
    this.isLoadingCheckout = false,
    this.checkoutSuccess = false,
    this.errorMessageCheckout,
    this.errorMessageCartTotal,
    this.errorMessageChangingQty,
    this.deleteCartLineSuccess = false,
    this.paymentMethod = PaymentMethod.cash,
  }) : cart = cart ?? [];

  factory CartState.init() => CartState(
      cart: [],
      isLoading: false,
      deleteCartIsLoading: false,
      isLoadingCartTotal: false,
      isLoadingCheckout: false,
      checkoutSuccess: false,
      deleteCartLineSuccess: false,
      isChangingQty: false,
      paymentMethod: PaymentMethod.cash);
  CartState copyWith({
    List<CartModel>? cart,
    CartTotalEntity? cartTotal,
    bool? isLoading,
    bool? isLoadingCartTotal,
    String? errorMessage,
    String? errorMessageCartTotal,
    String? deleteCartErrorMessage,
    bool? deleteCartIsLoading,
    bool? isLoadingCheckout,
    String? errorMessageCheckout,
    bool? checkoutSuccess,
    bool? deleteCartLineSuccess,
    bool? isChangingQty,
    String? errorMessageChangingQty,
    PaymentMethod? paymentMethod,
  }) =>
      CartState(
          cart: cart ?? this.cart,
          errorMessage: errorMessage,
          isLoading: isLoading ?? this.isLoading,
          isLoadingCartTotal: isLoadingCartTotal ?? this.isLoadingCartTotal,
          errorMessageCartTotal:
              errorMessageCartTotal ?? this.errorMessageCartTotal,
          cartTotal: cartTotal ?? this.cartTotal,
          deleteCartIsLoading: deleteCartIsLoading ?? this.deleteCartIsLoading,
          deleteCartErrorMessage: deleteCartErrorMessage,
          errorMessageCheckout: errorMessageCheckout,
          isLoadingCheckout: isLoadingCheckout ?? this.isLoadingCheckout,
          checkoutSuccess: checkoutSuccess ?? false,
          deleteCartLineSuccess: deleteCartLineSuccess ?? false,
          isChangingQty: isChangingQty ?? this.isChangingQty,
          errorMessageChangingQty: errorMessageChangingQty,
          paymentMethod: paymentMethod ?? this.paymentMethod);
  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        cart,
        errorMessageCartTotal,
        cartTotal,
        isLoadingCartTotal,
        deleteCartIsLoading,
        deleteCartErrorMessage,
        isLoadingCheckout,
        errorMessageCheckout,
        checkoutSuccess,
        deleteCartLineSuccess,
        isChangingQty,
        errorMessageChangingQty,
        paymentMethod,
      ];
}

enum PaymentMethod {
  cash,
  wallet,
}
