import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';

abstract interface class PaymentMethodsRemoteDataSource {
  Future<void> addNewCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  });
}

class PaymentMethodsRemoteDataSourceImpl implements PaymentMethodsRemoteDataSource {
  final Dio dio;

  PaymentMethodsRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> addNewCard({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
  }) async {
    try {
      _validateCardData(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvv: cvv,
      );

      final response = await dio.post(
        '/payment-methods/cards',
        data: {
          'card_number': cardNumber,
          'card_holder_name': cardHolderName,
          'expiry_date': expiryDate,
          'cvv': cvv,
        },
      );

      if (response.statusCode != 201) {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
      //  throw CardValidationException(message: e.response?.data['message'] ?? 'Invalid card data');
      }
      throw ServerException();
    }
  }

  void _validateCardData({
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) {
    if (cardNumber.length < 16) {
      //throw CardValidationException(message: 'Card number must be 16 digits');
    }

    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiryDate)) {
    //  throw CardValidationException(message: 'Invalid expiry date format (MM/YY)');
    }

    if (cvv.length != 3 && cvv.length != 4) {
    //  throw CardValidationException(message: 'CVV must be 3 or 4 digits');
    }
  }
}