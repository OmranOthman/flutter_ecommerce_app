part of 'search_cubit.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? search;
  final List<SearchModel>? searchModel;
  final List<SearchProductModel>? products;

  SearchState({
    List<SearchProductModel>? products,
    List<SearchModel>? searchModel,
    this.errorMessage,
    this.isLoading = false,
    this.search,
  })  : products = products ?? [],
        searchModel = searchModel ?? [];

  factory SearchState.init() => SearchState(
        isLoading: false,
        products: [],
      );
  SearchState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? search,
    List<SearchModel>? searchModel,
    List<SearchProductModel>? products,
  }) =>
      SearchState(
        errorMessage: errorMessage,
        isLoading: isLoading ?? this.isLoading,
        search: search ?? this.search,
        searchModel: searchModel ?? this.searchModel,
        products: products ?? this.products,
      );
  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        search,
        products,
        searchModel,
      ];
}
