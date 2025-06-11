import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

part 'app_launch_state.dart';

class AppLaunchCubit extends Cubit<AppLaunchState> {
  AuthRepository authRepository;
  AppLaunchCubit({
    required this.authRepository,
  }) : super(AppLaunchState());
  bool get checkIfFirstTimeOpenApp => authRepository.checkIfFirstTimeOpenApp;
    bool get hasToken => authRepository.hasToken;
  void saveFirstTimeOpenApp() {
    authRepository.saveFirstTimeOpenApp();
  }
}
