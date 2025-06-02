import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';

abstract interface class SettingsRepository {
  Future<ApiResult<void, Failure>> logout();
  Future<ApiResult<void, Failure>> changeLanguage(String languageCode);
  Future<ApiResult<void, Failure>> updateNotificationPreferences(bool enabled);
}