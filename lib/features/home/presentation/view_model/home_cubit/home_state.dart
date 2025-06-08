part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<PromotionModel>? promotions;
  final List<CollectionModel>? collections;
  final List<AdModel> ads;
  final PopupModel? popup;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const HomeState({
    this.promotions,
    this.collections,
    required this.ads,
    this.popup,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory HomeState.init() => HomeState(
        ads: <AdModel>[],
        collections: List.empty(),
        promotions: List.empty(),
        popup: PopupModel(),
        isLoading: false,
        isSuccess: false,
      );

  HomeState copyWith({
    List<PromotionModel>? promotions,
    List<CollectionModel>? collections,
    List<AdModel>? ads,
    PopupModel? popup,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) =>
      HomeState(
        promotions: promotions ?? this.promotions,
        collections: collections ?? this.collections,
        popup: popup ?? this.popup,
        ads: ads ?? this.ads,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [
        promotions,
        collections,
        ads,
        popup,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
