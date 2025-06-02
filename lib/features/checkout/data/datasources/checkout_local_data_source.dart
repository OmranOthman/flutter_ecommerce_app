import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CheckoutLocalDataSource {
  Future<void> updateShippingAddress(String addressId);
  Future<void> updatePaymentMethod(String cardId);
  Future<void> clearCheckoutData();
}

class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final SharedPreferences sharedPreferences;

  CheckoutLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> clearCheckoutData() {
    // TODO: implement clearCheckoutData
    throw UnimplementedError();
  }

  @override
  Future<void> updatePaymentMethod(String cardId) {
    // TODO: implement updatePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<void> updateShippingAddress(String addressId) {
    // TODO: implement updateShippingAddress
    throw UnimplementedError();
  }


}
