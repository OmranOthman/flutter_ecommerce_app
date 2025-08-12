import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/avatar_image.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/category_tab_view.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/home_tab_view.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<ProfileCubit>()..getMyProfile(),
        ),
        BlocProvider(
          create: (context) => di<HomeCubit>()..loadHomeData(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        leading: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                  highlightColor: AppColors.greyLightColor,
                  child: CircleAvatar(
                    radius: 50.r,
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: AvatarImage(
                networkImage: state.profileEntity!.networkImage,
                editButton: false,
              ),
            );
          },
        ),
        title: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            String name = state.profileEntity?.fullName ?? '';
            if (state.isLoading) {
              return Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                  highlightColor: AppColors.greyLightColor,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30.w,
                        height: 12.h,
                        color: Colors.white,
                      ),
                      Container(
                        width: 100.w,
                        height: 12.h,
                        color: Colors.white,
                      )
                    ],
                  ));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hi_greeting'.tr.replaceAll('{name}', name),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 18),
                ),
                Text(
                  'shopping_prompt'.tr,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                ),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePath.searchRoute);
            },
            icon: Icon(
              Icons.search,
              size: 24.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.notificationRoute);
            },
            icon: Icon(
              Icons.notifications_none,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              indicatorColor: Theme.of(context).primaryColor,
              controller: _tabController,
              dividerColor: Colors.transparent,
              unselectedLabelColor: AppColors.grey,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16),
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 14),
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
                controller: _tabController,
                children: const [
                  HomeTabView(),
                  CategoryTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
