import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';

class BiometricHelper {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Check if device supports biometric authentication
  static Future<bool> isBiometricSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (e) {
      debugPrint('Biometric support check error: $e');
      return false;
    }
  }

  /// Get available biometric types (fingerprint, face, etc.)
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      debugPrint('Get biometrics error: $e');
      return [];
    }
  }

  /// Check if at least one biometric method is available
  static Future<bool> canUseBiometric() async {
    try {
      final supported = await isBiometricSupported();
      if (!supported) return false;

      final available = await getAvailableBiometrics();
      return available.isNotEmpty;
    } catch (e) {
      debugPrint('Biometric availability check error: $e');
      return false;
    }
  }

  /// Authenticate with fallback (face > fingerprint > PIN)
  static Future<bool> authenticateWithFallback(BuildContext context) async {
    try {
      final available = await getAvailableBiometrics();
      final localizedReason = 'biometric_auth_reason'.tr;

      // Try Face ID first if available
      if (available.contains(BiometricType.face)) {
        final success = await _auth.authenticate(
          localizedReason: localizedReason,
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
        if (success) return true;
      }

      // Then try fingerprint
      if (available.contains(BiometricType.fingerprint)) {
        final success = await _auth.authenticate(
          localizedReason: localizedReason,
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
        if (success) return true;
      }

      // Fallback to device credentials
      final success = await _auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );

      return success;
    } catch (e) {
      debugPrint('Authentication error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('biometric_auth_failed'.tr)),
      );
      return false;
    }
  }

  /// Simple authentication (direct without fallback)
  static Future<bool> authenticate(BuildContext context) async {
    try {
      return await _auth.authenticate(
        localizedReason: 'biometric_auth_reason'.tr,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('biometric_auth_failed'.tr)),
      );
      return false;
    }
  }
}