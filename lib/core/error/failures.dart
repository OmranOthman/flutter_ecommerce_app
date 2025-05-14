import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class InternetConnectionFailure extends Failure {}

class DioFailure extends Failure {
  final DioException error;

  DioFailure({required this.error});
}

class UnknowFailure extends Failure {}
