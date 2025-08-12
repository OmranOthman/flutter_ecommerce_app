part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isLoadingToggling;
  final String? errorMessageToggling;
  final List<FavoriteItemEntity>? products;
  final List<FavoriteItemEntity>? vendors;
  final Section section;
  FavoriteState({
    List<FavoriteItemEntity>? vendors,
    List<FavoriteItemEntity>? products,
    this.isLoadingToggling = false,
    this.errorMessageToggling,
    this.errorMessage,
    this.section = Section.products,
    this.isLoading = false,
  })  : products = products ?? [],
        vendors = vendors ?? [];

  factory FavoriteState.init() => FavoriteState(
        isLoading: false,
        vendors: [],
        products: [],
        section: Section.products,
      );

  FavoriteState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FavoriteItemEntity>? products,
    List<FavoriteItemEntity>? vendors,
    bool? isLoadingToggling,
    String? errorMessageToggling,
    Section? section,
  }) =>
      FavoriteState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        products: products ?? this.products,
        vendors: vendors ?? this.vendors,
        errorMessageToggling: errorMessageToggling,
        isLoadingToggling: isLoadingToggling ?? this.isLoadingToggling,
        section: section ?? this.section,
      );
  @override
  List<Object?> get props => [
        isLoading,
        products,
        vendors,
        errorMessage,
        isLoadingToggling,
        errorMessageToggling,
        section,
      ];
}

enum Section { vendors, products }
