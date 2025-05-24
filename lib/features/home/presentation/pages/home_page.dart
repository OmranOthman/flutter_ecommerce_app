import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/category_tab_view.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = HomeCubit();
            cubit.getHomeData();
            return cubit;
          },
        ),
        BlocProvider(create: (context) => FavoriteCubit()),
      ],
      child: HomeView(tabController: _tabController),
    );
  }
}

class HomeView extends StatelessWidget {
  final TabController tabController;

  const HomeView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w, top: 8.h),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(''),
            radius: 25.r,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'hi_greeting'.tr.replaceAll('{name}', 'Omran'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
            ),
            Text(
              'shopping_prompt'.tr,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.grey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
              size: 24.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.notificationRoute);
            },
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                controller: tabController,
                unselectedLabelColor: AppColors.grey,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: -30.w),
                ),
                tabs: [
                  Tab(text: 'home'.tr),
                  Tab(text: 'category'.tr),
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    HomeTabView(),
                    CategoryTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}