abstract interface class AuthRepository {
  Future<void> saveFirstTimeOpenApp();
  bool get checkIfFirstTimeOpenApp;
}
