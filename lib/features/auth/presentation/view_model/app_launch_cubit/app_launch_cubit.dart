import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'app_launch_state.dart';

class AppLaunchCubit extends Cubit<AppLaunchState> {
  final AuthRepository authRepository;

  AppLaunchCubit({required this.authRepository}) : super(AppLaunchState()) {
    checkAppLaunchState();
  }

  bool get checkIfFirstTimeOpenApp => state.checkIfFirstTimeOpenApp;
  bool get hasToken => state.hasToken;

  void checkAppLaunchState() {
    final isFirstTime = authRepository.checkIfFirstTimeOpenApp;
    final tokenExists = authRepository.hasToken;

    emit(state.copyWith(
      checkIfFirstTimeOpenApp: isFirstTime,
      hasToken: tokenExists,
    ));
  }

  Future<void> saveFirstTimeOpenApp() async {
    await authRepository.saveFirstTimeOpenApp();
    emit(state.copyWith(checkIfFirstTimeOpenApp: false));
  }
}
