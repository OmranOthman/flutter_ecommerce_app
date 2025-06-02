import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


abstract class FavoritesLocalDataSource {
  Future<void> getFavoriteProducts();
  Future<void> addFavorite(ProductItemModel product);
  Future<void> removeFavorite(String productId);
  Future<bool> isFavorite(String productId);
}



class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const _favoritesKey = 'favorites';

  FavoritesLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<void> addFavorite(ProductItemModel product) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavorite(String productId) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavorite(String productId) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}