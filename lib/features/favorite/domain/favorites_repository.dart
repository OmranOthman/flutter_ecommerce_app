

abstract class FavoritesRepository {
  Future <void> getFavoriteProducts();
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
}