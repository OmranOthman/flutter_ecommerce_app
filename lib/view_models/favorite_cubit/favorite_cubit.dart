import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final String currentUserUid = "dummy_user_id";
  List<ProductItemModel> favoriteProducts = [];

  Future<void> getFavoriteProducts() async {
    emit(FavoriteLoading());
    try {
      favoriteProducts = dummyProducts
          .where((product) => product.price > 15)
          .toList();

      emit(FavoriteLoaded(favoriteProducts));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void addFavorite(ProductItemModel product) {
    if (!favoriteProducts.any((p) => p.id == product.id)) {
      favoriteProducts.add(product);
      emit(FavoriteLoaded(favoriteProducts));
    }
  }

  Future<void> removeFavorite(String productId) async {
    emit(FavoriteRemoving(productId));
    try {
      favoriteProducts.removeWhere((product) => product.id == productId);
      emit(FavoriteRemoved(productId));
      emit(FavoriteLoaded(favoriteProducts));
    } catch (e) {
      emit(FavoriteRemoveError(e.toString()));
    }
  }
}
