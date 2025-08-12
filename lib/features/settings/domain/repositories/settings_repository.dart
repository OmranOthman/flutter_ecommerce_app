import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/recharge_wallet_request_model.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/entities/profile_entity.dart';

abstract interface class SettingsRepository {
  Future<ApiResult<void, Failure>> logout();
  Future<ApiResult<ProfileEntity, Failure>> getMyProfile();
  Future<ApiResult<String, Failure>> getMyWallet();
  Future<ApiResult<void, Failure>> editMyProfile({
    required ProfileEntity profileEntity,
  });

  Future<ApiResult<void, Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });
  Future<ApiResult<void, Failure>> updateNotificationPreferences(bool enabled);

  Future<ApiResult<void, Failure>> rechargeWallet({
    required RechargeWalletRequestModel model,
  });

  Future<ApiResult<InfoModel, Failure>> getAppSettings();

}
