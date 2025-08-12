import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/bio_metriecs/helpers/bio_metric_helper.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/pages/main_page.dart';

class BioMetricPage extends StatefulWidget {
  const BioMetricPage({super.key});

  @override
  State<BioMetricPage> createState() => _BioMetricPageState();
}

class _BioMetricPageState extends State<BioMetricPage> {
  bool _authInProgress = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startBiometricAuth());
  }

  Future<void> _startBiometricAuth() async {
    if (!mounted) return;

    setState(() {
      _authInProgress = true;
      _errorMessage = null;
    });

    try {
      final didAuthenticate =
          await BiometricHelper.authenticateWithFallback(context);

      if (didAuthenticate && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainPage()),
        );
        return;
      }

      if (mounted) {
        setState(() => _errorMessage = 'authentication_failed'.tr);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'biometric_error'.tr);
      }
    } finally {
      if (mounted) {
        setState(() => _authInProgress = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('authentication'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_authInProgress) ...[
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text('authenticating'.tr),
              ] else ...[
                Icon(
                  Icons.fingerprint,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 20),
                Text(
                  _errorMessage ?? 'authentication_required'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: _startBiometricAuth,
                  child: Text(
                    'try_again'.tr,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
