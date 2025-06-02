import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CartLocalDataSource {
  Future<void> cacheCartItems(List<void> items);
  List<void> getCachedCartItems();
  Future<void> updateItemSelection(String itemId, bool selected);
  Future<void> removeItem(String itemId);
  Future<void> updateItemQuantity(String itemId, int quantity);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCartItems(List<void> items) async {

  }


  @override
  Future<void> updateItemSelection(String itemId, bool selected) async {

  }

  @override
  Future<void> removeItem(String itemId) async {

  }

  @override
  Future<void> updateItemQuantity(String itemId, int quantity) async {

  }

  @override
  List<void> getCachedCartItems() {
    // TODO: implement getCachedCartItems
    throw UnimplementedError();
  }
}