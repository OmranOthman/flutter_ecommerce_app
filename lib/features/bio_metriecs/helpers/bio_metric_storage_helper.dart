import 'package:shared_preferences/shared_preferences.dart';

class BiometricStorageHelper {
  static const String _biometricKey = "biometric_enabled";
  static const String _faceIdKey = "face_id_enabled";

  static Future<void> setBiometricEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_biometricKey, enabled);
  }

  static Future<bool> isBiometricEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_biometricKey) ?? false;
  }

  static Future<void> setFaceIdEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_faceIdKey, enabled);
  }

  static Future<bool> isFaceIdEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_faceIdKey) ?? false;
  }
}
