part of 'app_launch_cubit.dart';

class AppLaunchState {
  final bool checkIfFirstTimeOpenApp;
  final bool hasToken;

  AppLaunchState({
    this.checkIfFirstTimeOpenApp = true,
    this.hasToken = false,
  });

  AppLaunchState copyWith({
    bool? checkIfFirstTimeOpenApp,
    bool? hasToken,
  }) {
    return AppLaunchState(
      checkIfFirstTimeOpenApp: checkIfFirstTimeOpenApp ?? this.checkIfFirstTimeOpenApp,
      hasToken: hasToken ?? this.hasToken,
    );
  }
}
