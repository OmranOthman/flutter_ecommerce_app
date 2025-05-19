import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';


class OrderPage extends StatelessWidget { // يمكن أن يكون Stateless الآن
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Order"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.cartRoute);
              },
              icon: Icon(Icons.shopping_bag_outlined),
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppColors.grey,
            labelColor: AppColors.black,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Colors.deepPurple),
              insets: EdgeInsets.symmetric(horizontal: -30.0),
            ),
            tabs: const [
              Tab(text: 'My Order'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("My Order Content")),
            Center(child: Text("History Content")),
          ],
        ),
      ),
    );
  }
}