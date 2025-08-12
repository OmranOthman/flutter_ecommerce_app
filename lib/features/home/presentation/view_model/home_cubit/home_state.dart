part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<PromotionModel> promotions;
  final List<CollectionModel> collections;
  final List<AdModel> ads;
  final PopupModel? popup;
  final bool isLoadingToggling;
  final String? errorMessageToggling;
  final bool isLoading;
  final String? errorMessage;

  HomeState({
    List<PromotionModel>? promotions,
    List<CollectionModel>? collections,
    List<AdModel>? ads,
    this.errorMessageToggling,
    this.isLoadingToggling = false,
    this.popup,
    this.isLoading = false,
    this.errorMessage,
  })  : promotions = promotions ?? [],
        collections = collections ?? [],
        ads = ads ?? [];

  factory HomeState.init() => HomeState(
        ads: <AdModel>[],
        collections: List.empty(),
        promotions: List.empty(),
        popup: PopupModel(),
        isLoading: false,
        isLoadingToggling: false,
      );

  HomeState copyWith({
    List<PromotionModel>? promotions,
    List<CollectionModel>? collections,
    List<AdModel>? ads,
    PopupModel? popup,
    bool? isLoading,
    String? errorMessage,
    bool? isLoadingToggling,
    String? errorMessageToggling,
  }) =>
      HomeState(
          promotions: promotions ?? this.promotions,
          collections: collections ?? this.collections,
          popup: popup ?? this.popup,
          ads: ads ?? this.ads,
          isLoading: isLoading ?? this.isLoading,
          errorMessage: errorMessage,
          errorMessageToggling: errorMessageToggling,
          isLoadingToggling: isLoadingToggling ?? this.isLoadingToggling);

  @override
  List<Object?> get props => [
        promotions,
        collections,
        ads,
        popup,
        isLoading,
        errorMessage,
        isLoadingToggling,
        errorMessageToggling,
      ];
}
