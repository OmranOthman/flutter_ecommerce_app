import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Order",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.cartRoute);
              },
              icon: Icon(Icons.shopping_bag_outlined),
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppColors.grey,
            labelColor: AppColors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Theme.of(context).primaryColor),
              insets: const EdgeInsets.symmetric(horizontal: -30.0),
            ),
            tabs: [
              Tab(
                child: Text(
                  'My Order',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Tab(
                child: Text(
                  'History',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "My Order Content",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Center(
              child: Text(
                "History Content",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
