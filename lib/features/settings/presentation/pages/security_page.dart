import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/bio_metriecs/helpers/bio_metric_storage_helper.dart';
import 'package:flutter_ecommerce_app/features/bio_metriecs/helpers/bio_metric_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/toggle_item.dart';
import 'package:local_auth/local_auth.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool isBiometricEnabled = false;
  bool isFaceIdEnabled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    setState(() => _isLoading = true);
    try {
      final [enabled, faceEnabled] = await Future.wait([
        BiometricStorageHelper.isBiometricEnabled(),
        BiometricStorageHelper.isFaceIdEnabled(),
      ]);
      setState(() {
        isBiometricEnabled = enabled;
        isFaceIdEnabled = faceEnabled;
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _onToggleChanged(bool newValue) async {
    if (!mounted) return;

    setState(() => _isLoading = true);
    try {
      if (newValue) {
        if (!await BiometricHelper.canUseBiometric()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('biometric_not_available'.tr)),
          );
          return;
        }

        final didAuthenticate = await BiometricHelper.authenticate(context);
        if (didAuthenticate) {
          await BiometricStorageHelper.setBiometricEnabled(true);
          setState(() => isBiometricEnabled = true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('biometric_auth_failed'.tr)),
          );
        }
      } else {
        await BiometricStorageHelper.setBiometricEnabled(false);
        setState(() => isBiometricEnabled = false);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _onFaceToggleChanged(bool newValue) async {
    if (!mounted) return;

    setState(() => _isLoading = true);
    try {
      if (newValue) {
        final available = await BiometricHelper.getAvailableBiometrics();

        if (!available.contains(BiometricType.face)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('face_id_not_available'.tr)),
          );
          return;
        }

        final didAuthenticate = await BiometricHelper.authenticate(context);
        if (didAuthenticate) {
          await BiometricStorageHelper.setFaceIdEnabled(true);
          setState(() => isFaceIdEnabled = true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('face_id_auth_failed'.tr)),
          );
        }
      } else {
        await BiometricStorageHelper.setFaceIdEnabled(false);
        setState(() => isFaceIdEnabled = false);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('security'.tr, style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.w),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ToggleItem(
                      title: 'face_id'.tr,
                      isLast: false,
                      value: isFaceIdEnabled,
                      onChanged: _onFaceToggleChanged,
                      text: "this_service_is_for_ios_only".tr,

                    ),
                    ToggleItem(
                      title: 'touch_id'.tr,
                      isLast: true,
                      value: isBiometricEnabled,
                      onChanged: _onToggleChanged,
                      text: "the_protection_methods_defined_on_the_device_will_be_adopted".tr,
                      subtitleHeight: 40.h,
                      subtitleWidth: 200.w,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
