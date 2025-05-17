class AppAssets {
  static AppIcons icons = AppIcons();
  static AppImages images = AppImages();
}

class AppIcons {}

class AppImages {
  String onboarding1 = 'onboarding1'.pngImage;
  String onboarding2 = 'onboarding2'.pngImage;
  String onboarding3 = 'onboarding3'.pngImage;
}

extension AppAssetsStringExt on String {
  String get pngImage => 'assets/images/$this.png';
  String get pngIcon => 'assets/icons/$this.png';
}
