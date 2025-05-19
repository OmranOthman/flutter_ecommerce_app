import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_state.dart';

part 'auth_cubit.freezed.dart';



class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
   AuthCubit({required this.authRepository})
      : super(AuthState.init());

  void saveFirstTimeOpenApp() {
    authRepository.saveFirstTimeOpenApp();
  }

  bool get checkIfFirstTimeOpenApp => authRepository.checkIfFirstTimeOpenApp;


}
