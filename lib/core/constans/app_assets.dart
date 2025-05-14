class AppAssets {
  static AppIcons icons = AppIcons();
  static AppImages images = AppImages();
}

class AppIcons {
  String show = 'show'.pngIcon;
    String favorite = 'favorite'.pngIcon;
      String forward = 'forward'.pngIcon;
}

class AppImages {
  String logo = 'logo'.pngImage;
  String logoIcon = 'logo_icon'.pngImage;
  String foodie = 'foodie'.pngImage;
  String welcomeLogo = 'welcome_logo'.pngImage;
  String foodImage = 'food'.pngImage;
}

extension AppAssetsStringExt on String {
  String get pngImage => 'assets/images/$this.png';
  String get pngIcon => 'assets/icons/$this.png';
}
