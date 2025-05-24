import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/pages/home_page.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _tabs(BuildContext context) {
    return [
      PersistentTabConfig(
        screen: const HomePage(),
        item: ItemConfig(
          icon: Icon(Symbols.home, size: 24.sp),
          title: "Home",
          activeForegroundColor: Theme.of(context).primaryColor,
          inactiveForegroundColor: AppColors.grey,
          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12.sp) ?? TextStyle(fontSize: 12.sp),
        ),
      ),
      PersistentTabConfig(
        screen: const OrderPage(),
        item: ItemConfig(
          icon: Icon(Symbols.delivery_truck_speed, size: 24.sp),
          title: "My Order",
          activeForegroundColor: Theme.of(context).primaryColor,
          inactiveForegroundColor: AppColors.grey,
          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12.sp) ?? TextStyle(fontSize: 12.sp),
        ),
      ),
      PersistentTabConfig(
        screen: const FavoritesPage(),
        item: ItemConfig(
          icon: Icon(Symbols.favorite, size: 24.sp),
          title: "Favorites",
          activeForegroundColor: Theme.of(context).primaryColor,
          inactiveForegroundColor: AppColors.grey,
          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12.sp) ?? TextStyle(fontSize: 12.sp),
        ),
      ),
      PersistentTabConfig(
        screen: const SettingsPage(),
        item: ItemConfig(
          icon: Icon(Symbols.person, size: 24.sp),
          title: "Profile",
          activeForegroundColor: Theme.of(context).primaryColor,
          inactiveForegroundColor: AppColors.grey,
          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12.sp) ?? TextStyle(fontSize: 12.sp),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(context),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
      onTabChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      // يمكنك تعديل خصائص أخرى هنا مثل navBarHeight أيضاً باستخدام ScreenUtil:
      navBarHeight: 60.h,
    );
  }
}
