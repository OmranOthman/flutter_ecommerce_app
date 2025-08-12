part of 'collection_cubit.dart';

class CollectionState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? errorMessageToggling;
  final CollectionDetailsModel? collectionDetails;
  final List<CollectionVendorModel>? collectionVendors;
  final FiltersModel? filters;
  final List<int> selectedCuisineIds;
  final bool isLoadingToggling;

  CollectionState({
    List<CollectionVendorModel>? collectionVendors,
    this.isLoading = false,
    this.isLoadingToggling = false,
    this.errorMessage,
    this.collectionDetails,
    this.filters,
    this.errorMessageToggling,
    required this.selectedCuisineIds,
  }) : collectionVendors = collectionVendors ?? [];

  factory CollectionState.init() => CollectionState(
      isLoading: false,
      isLoadingToggling: false,
      selectedCuisineIds: [],
      collectionVendors: List.empty());

  CollectionState copyWith({
    bool? isLoading,
    bool? isLoadingToggling,
    String? errorMessage,
    CollectionDetailsModel? collectionDetails,
    List<CollectionVendorModel>? collectionVendors,
    FiltersModel? filters,
    List<int>? selectedCuisineIds,
    String? errorMessageToggling,
  }) {
    return CollectionState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        collectionDetails: collectionDetails ?? this.collectionDetails,
        collectionVendors: collectionVendors ?? this.collectionVendors,
        filters: filters ?? this.filters,
        selectedCuisineIds: selectedCuisineIds ?? this.selectedCuisineIds,
        isLoadingToggling: isLoadingToggling ?? this.isLoadingToggling,
        errorMessageToggling: errorMessageToggling,
       );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        collectionDetails,
        collectionVendors,
        filters,
        selectedCuisineIds,
        isLoadingToggling,
        errorMessageToggling,
      ];
}
