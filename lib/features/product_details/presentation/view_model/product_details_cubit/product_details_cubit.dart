import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductSize? selectedSize;
  int quantity = 1;
  double unitPrice = 0.0;

  double get totalPrice => quantity * unitPrice;

  void getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    try {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      unitPrice = selectedProduct.price;
      quantity = 1;
      emit(ProductDetailsLoaded(product: selectedProduct));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void selectSize(ProductSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  Future<void> addToCart(String productId) async {
    emit(ProductAddingToCart());
    try {
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == productId);

      final cartItem = AddToCartModel(
        id: DateTime.now().toIso8601String(),
        product: selectedProduct,
        size: selectedSize!,
        quantity: quantity,
      );

      dummyCart.add(cartItem);

      emit(ProductAddedToCart(productId: productId));
    } catch (e) {
      emit(ProductAddToCartError(e.toString()));
    }
  }

  void incrementCounter(String productId) {
    quantity++;
    emit(QuantityCounterLoaded(value: quantity));
  }

  void decrementCounter(String productId) {
    if (quantity > 1) {
      quantity--;
      emit(QuantityCounterLoaded(value: quantity));
    }
  }
}