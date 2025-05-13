import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void setUserData(String username, String email) {
    emit(ProfileLoaded(username, email));
  }
}

abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final String username;
  final String email;

  ProfileLoaded(this.username, this.email);
}