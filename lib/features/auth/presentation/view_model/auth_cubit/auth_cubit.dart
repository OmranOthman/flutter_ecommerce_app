import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

// نموذج بيانات وهمية
class UserData {
  final String id;
  final String username;
  final String email;
  final String createdAt;

  const UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'createdAt': createdAt,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      createdAt: map['createdAt'],
    );
  }
}

final List<UserData> dummyUsers = [];
UserData? fakeLoggedInUser;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = dummyUsers.firstWhere(
              (u) => u.email == email,
          orElse: () => throw Exception("User not found"));
      fakeLoggedInUser = user;
      emit(const AuthDone());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password, String username) async {
    emit(AuthLoading());
    try {
      final exists =
      dummyUsers.any((user) => user.email.toLowerCase() == email.toLowerCase());
      if (exists) {
        emit(const AuthError('User already exists'));
        return;
      }

      final newUser = UserData(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        username: username,
        email: email,
        createdAt: DateTime.now().toIso8601String(),
      );
      dummyUsers.add(newUser);
      fakeLoggedInUser = newUser;
      emit(const AuthDone());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void checkAuth() {
    if (fakeLoggedInUser != null) {
      emit(const AuthDone());
    }
  }

  Future<void> logout() async {
    emit(const AuthLoggingOut());
    try {
      fakeLoggedInUser = null;
      emit(const AuthLoggedOut());
    } catch (e) {
      emit(AuthLogOutError(e.toString()));
    }
  }

  Future<void> authenticateWithGoogle() async {
    emit(const GoogleAuthenticating());
    try {
      final user = UserData(
        id: 'google_dummy_id',
        username: 'Google User',
        email: 'google@example.com',
        createdAt: DateTime.now().toIso8601String(),
      );
      dummyUsers.add(user);
      fakeLoggedInUser = user;
      emit(const GoogleAuthDone());
    } catch (e) {
      emit(GoogleAuthError(e.toString()));
    }
  }

  Future<void> authenticateWithFacebook() async {
    emit(const FacebookAuthenticating());
    try {
      final user = UserData(
        id: 'facebook_dummy_id',
        username: 'Facebook User',
        email: 'facebook@example.com',
        createdAt: DateTime.now().toIso8601String(),
      );
      dummyUsers.add(user);
      fakeLoggedInUser = user;
      emit(const FacebookAuthDone());
    } catch (e) {
      emit(FacebookAuthError(e.toString()));
    }
  }
}
