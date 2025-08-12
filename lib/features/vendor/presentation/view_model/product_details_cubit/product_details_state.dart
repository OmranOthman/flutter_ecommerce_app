import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_details_model/product_details_model.dart';

class ProductDetailsState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool favoriteIsLoading;
  final String? favoriteErrorMessage;
  final bool addToCartIsLoading;
  final bool addToCartSuccess;
  final String? addToCartErrorMessage;
  final ProductDetailsModel? product;
  final int quantity;
  final num totalPrice;

  const ProductDetailsState({
    this.isLoading = false,
    this.favoriteErrorMessage,
    this.addToCartIsLoading = false,
    this.addToCartErrorMessage,
    this.favoriteIsLoading = false,
    this.addToCartSuccess = false,
    this.errorMessage,
    this.product,
    this.quantity = 1,
    this.totalPrice = 0,
  });

  factory ProductDetailsState.init() {
    return const ProductDetailsState(
      isLoading: false,
      favoriteIsLoading: false,
      addToCartIsLoading: false,
      addToCartSuccess: false,
      quantity: 1,
      totalPrice: 0,
    );
  }

  ProductDetailsState copyWith({
    bool? isLoading,
    String? errorMessage,
    ProductDetailsModel? product,
    bool? favoriteIsLoading,
    String? favoriteErrorMessage,
    int? quantity,
    num? totalPrice,
    bool? addToCartIsLoading,
    bool? addToCartSuccess,
    String? addToCartErrorMessage,
  }) {
    return ProductDetailsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      favoriteErrorMessage: favoriteErrorMessage,
      favoriteIsLoading: favoriteIsLoading ?? this.favoriteIsLoading,
      addToCartErrorMessage: addToCartErrorMessage,
      addToCartIsLoading: addToCartIsLoading ?? this.addToCartIsLoading,
      addToCartSuccess: addToCartSuccess ?? false,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        product,
        quantity,
        totalPrice,
        favoriteErrorMessage,
        favoriteIsLoading,
        addToCartIsLoading,
        addToCartErrorMessage,
        addToCartSuccess,
      ];
}
