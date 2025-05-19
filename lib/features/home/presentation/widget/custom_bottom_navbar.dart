import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_page.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/pages/home_page.dart';
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
    _controller = PersistentTabController();
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      const HomePage(),
      const OrderPage(),
      const FavoritesPage(),
      const SettingsPage(),
    ];
  }

  List<ItemConfig> _navBarsItems() {
    return [
      ItemConfig(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeForegroundColor: Theme.of(context).primaryColor,
        // activeColorPrimary: Theme.of(context).primaryColor,
        // inactiveColorPrimary: AppColors.grey,
      ),
      ItemConfig(
        icon: const Icon(CupertinoIcons.car_detailed),
        title: "My Order",
        activeForegroundColor: Theme.of(context).primaryColor,
        // activeColorPrimary: Theme.of(context).primaryColor,
        // inactiveColorPrimary: AppColors.grey,
      ),
      ItemConfig(
        icon: const Icon(CupertinoIcons.heart),
        title: "Favorites",
        activeForegroundColor: Theme.of(context).primaryColor,
        // activeColorPrimary: Theme.of(context).primaryColor,
        // inactiveColorPrimary: AppColors.grey,
      ),
      ItemConfig(
        icon: const Icon(CupertinoIcons.person),
        title: "Profile",
        activeForegroundColor: Theme.of(context).primaryColor,
        // activeColorPrimary: Theme.of(context).primaryColor,
        // inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PersistentTabView(
        controller: _controller,
        tabs: [
          PersistentTabConfig(
            item: _navBarsItems()[0],
            screen: _buildScreens(context)[0],
          ),
          PersistentTabConfig(
            item: _navBarsItems()[1],
            screen: _buildScreens(context)[1],
          ),
          PersistentTabConfig(
            item: _navBarsItems()[2],
            screen: _buildScreens(context)[2],
          ),
          PersistentTabConfig(
            item: _navBarsItems()[3],
            screen: _buildScreens(context)[3],
          ),
        ],
        navBarBuilder: (navbarConfig) => Style1BottomNavBar(
          navBarConfig: navbarConfig,
        ),
        onTabChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: AppColors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset:
            true,
        stateManagement: false,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
      ),
    );
  }
}
