import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_item_entity.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/repositories/favorites_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoritesRepository favoritesRepository;
  FavoriteCubit({required this.favoritesRepository})
      : super(FavoriteState.init());

  void switchTab(Section? section) {
    emit(state.copyWith(section: section));
  }

  Future<void> getFavorite() async {
    emit(state.copyWith(isLoading: true));
    await favoritesRepository.getFavorite().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoading: false,
              errorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isLoading: false,
            products: result.dataResponse!.products,
            vendors: result.dataResponse!.vendors,
          ));
        }
      },
    );
  }

  Future<void> toggleFavorite({
    required int index,
    required String type,
    required int id,
  }) async {
    emit(state.copyWith(isLoadingToggling: true));
    await favoritesRepository
        .toggleFavorite(index: index, id: id, type: type)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoadingToggling: false,
              errorMessageToggling: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
              isLoadingToggling: false,
              products: result.dataResponse!.products,
              vendors: result.dataResponse!.vendors));
        }
      },
    );
  }
}
