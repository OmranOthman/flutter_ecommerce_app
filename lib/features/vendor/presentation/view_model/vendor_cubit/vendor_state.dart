part of 'vendor_cubit.dart';

class VendorState extends Equatable {
  final bool isLoading;
  final bool favoriteIsLoading;
  final String? favoriteErrorMessage;
  final bool favoriteProductIsLoading;
  final String? favoriteProductErrorMessage;
  final String? errorMessage;
  final VendorDetailsModel? vendorDetails;
  final CategoryModel? selectedCategory;

  const VendorState({
    this.isLoading = false,
    this.favoriteProductIsLoading = false,
    this.favoriteProductErrorMessage,
    this.errorMessage,
    this.vendorDetails,
    this.selectedCategory,
    this.favoriteErrorMessage,
    this.favoriteIsLoading = false,
  });

  factory VendorState.init() {
    return const VendorState(
      isLoading: false,
      favoriteIsLoading: false,
      errorMessage: null,
      vendorDetails: null,
    );
  }

  VendorState copyWith({
    bool? isLoading,
    String? errorMessage,
    VendorDetailsModel? vendorDetails,
    CategoryModel? selectedCategory,
    bool? favoriteIsLoading,
    String? favoriteErrorMessage,
    bool? favoriteProductIsLoading,
    String? favoriteProductErrorMessage,
  }) {
    return VendorState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        vendorDetails: vendorDetails ?? this.vendorDetails,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        favoriteErrorMessage: favoriteErrorMessage,
        favoriteIsLoading: favoriteIsLoading ?? this.favoriteIsLoading,
        favoriteProductIsLoading:
            favoriteProductIsLoading ?? this.favoriteProductIsLoading,
        favoriteProductErrorMessage: favoriteProductErrorMessage);
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        vendorDetails,
        selectedCategory,
        favoriteIsLoading,
        favoriteErrorMessage,
        favoriteProductErrorMessage,
        favoriteProductIsLoading
      ];
}
