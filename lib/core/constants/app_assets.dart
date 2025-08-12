class AppAssets {
  static AppIcons icons = AppIcons();
  static AppImages images = AppImages();
}

class AppIcons {
  String favorite = 'favorite'.svgIcon;
  String favoriteSelect = 'favorite_select'.svgIcon;
  String home = 'home'.svgIcon;
  String homeSelect = 'home_select'.svgIcon;
  String myOrder = 'my_order'.svgIcon;
  String myOrderSelect = 'my_order_select'.svgIcon;
  String myProfile = 'my_profile'.svgIcon;
  String myProfileSelect = 'my_profile_select'.svgIcon;
}

class AppImages {
  String onboarding1 = 'onboarding1'.pngImage;
  String onboarding2 = 'onboarding2'.pngImage;
  String onboarding3 = 'onboarding3'.pngImage;
  String error = 'error'.pngImage;
  String user = 'user'.pngImage;
  String logoFacebook = 'facebook_logo'.pngImage;
  String logoGoogle = 'google_logo'.pngImage;
  String success = 'success'.pngImage;
  String verification = 'verification'.pngImage;
  String address = 'address'.pngImage;
  String map = 'map'.pngImage;
}

extension AppAssetsStringExt on String {
  String get pngImage => 'assets/images/$this.png';

  String get pngIcon => 'assets/icons/$this.png';

  String get svgIcon => 'assets/icons/$this.svg';
}
