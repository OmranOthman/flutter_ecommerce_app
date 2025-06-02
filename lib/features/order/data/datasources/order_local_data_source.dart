import 'package:shared_preferences/shared_preferences.dart';

abstract interface class OrdersLocalDataSource {
  Future<void> cacheActiveOrders(List<void> orders);
  List<void> getCachedActiveOrders();
  Future<void> cacheOrderHistory(List<void> history);
  List<void> getCachedOrderHistory();
  Future<void> removeOrder(String orderId);
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  final SharedPreferences sharedPreferences;

  OrdersLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheActiveOrders(List<void> orders) {
    // TODO: implement cacheActiveOrders
    throw UnimplementedError();
  }

  @override
  Future<void> cacheOrderHistory(List<void> history) {
    // TODO: implement cacheOrderHistory
    throw UnimplementedError();
  }

  @override
  List<void> getCachedActiveOrders() {
    // TODO: implement getCachedActiveOrders
    throw UnimplementedError();
  }

  @override
  List<void> getCachedOrderHistory() {
    // TODO: implement getCachedOrderHistory
    throw UnimplementedError();
  }

  @override
  Future<void> removeOrder(String orderId) {
    // TODO: implement removeOrder
    throw UnimplementedError();
  }

}