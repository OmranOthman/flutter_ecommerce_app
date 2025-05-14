import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_tab_view.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_tab_view.dart';

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
         BlocProvider(
      create: (context) => FavoriteCubit(),)
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                controller: _tabController,
                unselectedLabelColor: AppColors.grey,
                labelColor: AppColors.black,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Colors.deepPurple),
                  insets: EdgeInsets.symmetric(horizontal: -30.0),
                ),
                tabs: const [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Category',
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
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
      ),
    );
  }
}
