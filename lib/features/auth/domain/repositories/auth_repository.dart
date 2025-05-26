abstract interface class AuthRepository {
  Future<void> saveFirstTimeOpenApp();
  bool get checkIfFirstTimeOpenApp;
  Future<void> login({required String email, required String password});
  Future<void> signup({required String fullName,required String email, required String password});

}
