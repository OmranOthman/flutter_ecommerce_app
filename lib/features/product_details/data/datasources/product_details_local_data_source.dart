import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract interface class ProductDetailsLocalDataSource {
  Future<void> cacheProductDetails(ProductItemModel product);
  ProductItemModel? getCachedProductDetails(String productId);
}


class ProductDetailsLocalDataSourceImpl implements ProductDetailsLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductDetailsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheProductDetails(ProductItemModel product) {
    // TODO: implement cacheProductDetails
    throw UnimplementedError();
  }

  @override
  ProductItemModel? getCachedProductDetails(String productId) {
    // TODO: implement getCachedProductDetails
    throw UnimplementedError();
  }


}