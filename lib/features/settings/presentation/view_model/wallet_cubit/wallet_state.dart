part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? wallet;
  const WalletState({
    this.errorMessage,
    this.isLoading = false,
    this.wallet,
  });
  factory WalletState.init() => WalletState(
        isLoading: false,
      );

  WalletState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? wallet,
  }) {
    return WalletState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      wallet: wallet ?? this.wallet,
    );
  }

  @override
  List<Object?> get props => [
        wallet,
        errorMessage,
        isLoading,
      ];
}
