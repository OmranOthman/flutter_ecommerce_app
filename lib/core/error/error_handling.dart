import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';

String failureHandlingMessage(Failure failure) {
  switch (failure) {
    case ServerFailure():
      return 'Server Error, Try again.';
    case InternetConnectionFailure():
      return 'No internet connection, Try again';

    case DioFailure():
      return dioErrorMessage(failure.error);
    default:
      return 'Unknown Error, Try again';
  }
}

String dioErrorMessage(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return 'Not found resource';

    case DioExceptionType.connectionTimeout:
      return 'Server is not responding';
    case DioExceptionType.unknown:
      return 'Unknown Error, Try again';

    case DioExceptionType.connectionError:
      return 'Connection Error, Try again.';
    case DioExceptionType.receiveTimeout:
      return 'Not found resource';

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 500:
          return 'Internal Server Error';
        case 404:
        case 503:
        case 400:
          return error.response!.data['error']['message']??"";

        default:
          return "${error.response!.statusMessage}";
      }
    case DioExceptionType.sendTimeout:
      return 'Not found resource';

    default:
      return 'Not found resource';
  }
}
