import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/repositories/vendor_repository.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final VendorRepository vendorRepository;

  ProductDetailsCubit({required this.vendorRepository})
      : super(ProductDetailsState.init());

  Future<void> fetchProductDetails(int productId) async {
    emit(state.copyWith(isLoading: true));

    final result = await vendorRepository.getProductDetails(productId);
    if (result.dataResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        product: result.dataResponse!,
        quantity: 1,
        totalPrice: result.dataResponse!.price! * 1,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    }
  }

  Future<void> toggleFavoriteProduct() async {
    emit(state.copyWith(favoriteIsLoading: true));

    await vendorRepository
        .toggleFavoriteProduct(productId: state.product!.id!)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            favoriteIsLoading: false,
            favoriteErrorMessage: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            favoriteIsLoading: false,
            product: result.dataResponse!,
          ));
        }
      },
    );
  }

  Future<void> addToCart() async {
    emit(state.copyWith(addToCartIsLoading: true));

    await vendorRepository
        .addToCart(
      productId: state.product!.id!,
      quantity: state.quantity,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            addToCartIsLoading: false,
            addToCartErrorMessage:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            addToCartIsLoading: false,
            addToCartSuccess: true,
          ));
        }
      },
    );
  }

  Future<void> addForceCart() async {
    emit(state.copyWith(addToCartIsLoading: true));

    await vendorRepository
        .addForceCart(
      productId: state.product!.id!,
      quantity: state.quantity,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            addToCartIsLoading: false,
            addToCartErrorMessage:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            addToCartIsLoading: false,
            addToCartSuccess: true,
          ));
        }
      },
    );
  }

  void increaseQuantity() {
    int newQuantity = state.quantity + 1;
    emit(state.copyWith(
      quantity: newQuantity,
      totalPrice: state.product!.price! * newQuantity,
    ));
  }

  void decreaseQuantity() {
    if (state.quantity > 1) {
      int newQuantity = state.quantity - 1;
      emit(state.copyWith(
        quantity: newQuantity,
        totalPrice: state.product!.price! * newQuantity,
      ));
    }
  }
}
