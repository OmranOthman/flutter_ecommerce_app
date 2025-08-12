import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/svg_icon.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/view_model/cubit/main_cubit.dart';
import 'package:flutter_ecommerce_app/features/order/presentation/pages/order_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => MainPage(),
      );
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainCubit>(),
      child: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrderPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: _widgetOptions.elementAt(state.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomNavigationBarItem,
            currentIndex: state.selectedIndex,
            unselectedItemColor: AppColors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            onTap: (newIndex) {
            if (newIndex == 3) {
                Navigator.of(context).pushNamed(RoutePath.settingsRoute);
              } else {
                mainCubit.onItemTapped(newIndex);
              }
            },
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItem => [
    BottomNavigationBarItem(
      icon: SvgIcon(assetPath: AppAssets.icons.home, size: 24.r),
      activeIcon: SvgIcon(assetPath: AppAssets.icons.homeSelect, size: 24.r),
      label: "home".tr,
    ),
    BottomNavigationBarItem(
      icon: SvgIcon(assetPath: AppAssets.icons.myOrder, size: 24.r),
      activeIcon: SvgIcon(assetPath: AppAssets.icons.myOrderSelect, size: 24.r),
      label: "my_order".tr,
    ),
    BottomNavigationBarItem(
      icon: SvgIcon(assetPath: AppAssets.icons.favorite, size: 24.r),
      activeIcon: SvgIcon(assetPath:AppAssets.icons.favoriteSelect, size: 24.r),
      label: "favorites".tr,
    ),
    BottomNavigationBarItem(
      icon: SvgIcon(assetPath: AppAssets.icons.myProfile, size: 24.r),
      activeIcon: SvgIcon(assetPath: AppAssets.icons.myProfileSelect, size: 24.r),
      label: "profile".tr,
    )
      ];
}
