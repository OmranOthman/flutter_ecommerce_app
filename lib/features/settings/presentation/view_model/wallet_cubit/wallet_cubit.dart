import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/recharge_wallet_request_model.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  SettingsRepository settingsRepository;
  WalletCubit({required this.settingsRepository}) : super(WalletState.init());

  Future<void> getMyWallet() async {
    emit(state.copyWith(isLoading: true));
    await settingsRepository.getMyWallet().then(
      (result) {
        if (result.errorResponse != null) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: failureHandlingMessage(
                result.errorResponse!,
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              wallet: result.dataResponse,
            ),
          );
        }
      },
    );
  }


  Future<void> rechargeWallet({required String code}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await settingsRepository.rechargeWallet(
      model: RechargeWalletRequestModel(code: code),
    );

    if (result.errorResponse != null) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(result.errorResponse!),
        ),
      );
    } else {
      await getMyWallet();
    }
  }

}
