part of 'log_out_cubit.dart';

class LogOutState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  const LogOutState(
      {this.isLoading = false, this.errorMessage, this.successMessage});
  factory LogOutState.init() => LogOutState(
        isLoading: false,
      );

  LogOutState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) =>
      LogOutState(
        isLoading: isLoading ?? this.isLoading,
        successMessage: successMessage,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        successMessage,
      ];
}
