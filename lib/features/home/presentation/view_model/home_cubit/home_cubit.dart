import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/models/home_carosel_item_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final products = dummyProducts;
      final carouselItems = dummyHomeCarouselItems;

      emit(HomeLoaded(
        carouselItems: carouselItems,
        products: products,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> setFavorite(
      ProductItemModel product, FavoriteCubit favoriteCubit) async {
    emit(SetFavoriteLoading(product.id));
    try {
      final newProduct = product.copyWith(isFavorite: !product.isFavorite);

      // تحديث قائمة المفضلة
      if (newProduct.isFavorite) {
        favoriteCubit.addFavorite(newProduct);
      } else {
        await favoriteCubit.removeFavorite(newProduct.id);
      }

      emit(SetFavoriteSuccess(
        isFavorite: newProduct.isFavorite,
        productId: newProduct.id,
      ));
    } catch (e) {
      emit(SetFavoriteError(e.toString(), product.id));
    }
  }
}
