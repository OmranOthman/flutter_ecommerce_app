import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          padding: const EdgeInsets.only(left: 14, top: 8),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://media.licdn.com/dms/image/v2/D4D35AQETK974HtDMyw/profile-framedphoto-shrink_400_400/profile-framedphoto-shrink_400_400/0/1712976653786?e=1747382400&v=beta&t=UHj7T5TQ9EdKWvkHk93SpedMMnlMGrdRXyWywBL6CEo'),
            radius: 25,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omran',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Let\'s go shopping!',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.grey,
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
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.notificationRoute);
            },
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                controller: tabController,
                unselectedLabelColor: AppColors.grey,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  insets: const EdgeInsets.symmetric(horizontal: -30.0),
                ),
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Category'),
                ],
              ),
              const SizedBox(height: 24.0),
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