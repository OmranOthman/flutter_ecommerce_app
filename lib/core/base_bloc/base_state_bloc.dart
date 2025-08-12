import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final bool hasSuccess;
  final String? errorMessage;

  bool get isError => hasError && errorMessage != null;

  bool get isLoading => hasLoading;
  bool get isSuccess => hasSuccess;

  String? get errorMessageState => errorMessage;

  const BaseBlocState({
    required this.hasLoading,
    required this.hasError,
    required this.hasSuccess,
    this.errorMessage,
  });

  List<Object?> get stateProps;

  @override
  List<Object?> get props => [
    ...stateProps,
    isLoading,
    isError,
    isSuccess,
    errorMessage,
  ];
}
