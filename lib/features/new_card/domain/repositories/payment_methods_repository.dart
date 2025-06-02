import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class PaymentMethodsRepository {
  Future<ApiResult<void, Failure>> addNewCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  });
}