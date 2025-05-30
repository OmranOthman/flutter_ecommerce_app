import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/views/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/profile_page.dart';
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
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage(),
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
        icon: const Icon(CupertinoIcons.cart),
        title: "Cart",
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
      appBar: AppBar(backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14,top: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => Navigator.pushNamed(context, AppRoutes.settingsRoute),
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://media.licdn.com/dms/image/v2/D4D35AQETK974HtDMyw/profile-framedphoto-shrink_400_400/profile-framedphoto-shrink_400_400/0/1712976653786?e=1747382400&v=beta&t=UHj7T5TQ9EdKWvkHk93SpedMMnlMGrdRXyWywBL6CEo'),
              radius: 25,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omran',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'Let\'s go shopping!',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        actions: [
          if (currentIndex == 0) ...[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ] else if (currentIndex == 1)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag),
            ),
        ],
      ),
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
