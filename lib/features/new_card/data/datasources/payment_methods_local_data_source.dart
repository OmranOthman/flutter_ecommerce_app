import 'package:shared_preferences/shared_preferences.dart';


abstract class PaymentMethodsLocalDataSource {
  Future<List<void>> getSavedPaymentMethods();
  Future<void> savePaymentMethod();
  Future<void> removePaymentMethod(String methodId);
  Future<void> setDefaultPaymentMethod(String methodId);
  Future<void> getDefaultPaymentMethod();
}



class PaymentMethodsLocalDataSourceImpl implements PaymentMethodsLocalDataSource
{
  final SharedPreferences sharedPreferences;
  static const _paymentMethodsKey = 'payment_methods';
  static const _defaultPaymentMethodKey = 'default_payment_method';

  PaymentMethodsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> getDefaultPaymentMethod() {
    // TODO: implement getDefaultPaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<List<void>> getSavedPaymentMethods() {
    // TODO: implement getSavedPaymentMethods
    throw UnimplementedError();
  }

  @override
  Future<void> removePaymentMethod(String methodId) {
    // TODO: implement removePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<void> savePaymentMethod() {
    // TODO: implement savePaymentMethod
    throw UnimplementedError();
  }

  @override
  Future<void> setDefaultPaymentMethod(String methodId) {
    // TODO: implement setDefaultPaymentMethod
    throw UnimplementedError();
  }


}