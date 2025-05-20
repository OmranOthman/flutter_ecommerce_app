class AppAssets {
  static AppIcons icons = AppIcons();
  static AppImages images = AppImages();
}

class AppIcons {}

class AppImages {
  String onboarding1 = 'onboarding1'.pngImage;
  String onboarding2 = 'onboarding2'.pngImage;
  String onboarding3 = 'onboarding3'.pngImage;

  String logoFacebook = 'facebook_logo'.pngImage;
  String logoGoogle = 'google_logo'.pngImage;

  String success = 'success'.pngImage;
  String verification = 'verification'.pngImage;
}

extension AppAssetsStringExt on String {
  String get pngImage => 'assets/images/$this.png';
  String get pngIcon => 'assets/icons/$this.png';
}
