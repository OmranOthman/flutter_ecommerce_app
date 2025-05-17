import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  AuthRepository authRepository;

  OnBoardingCubit({required this.authRepository})
      : super(OnBoardingState.init());

  void saveFirstTimeOpenApp() {
    authRepository.saveFirstTimeOpenApp();
  }

  bool get checkIfFirstTimeOpenApp => authRepository.checkIfFirstTimeOpenApp;
}
