import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, AppRoutes.settingNotificationsRoute);
          //   },
          //   icon: const Icon(Icons.settings),
          // ),
        ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Recent",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            NotificationCard(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              title: "Purchase Completed!",
              message: "You have successfully purchased 334 headphones, thank you and wait for your package to arrive",
              time: "9:30 AM",
              hasAction: false,
            ),

            NotificationCard(
              icon: Icons.message,
              iconColor: Colors.blue,
              title: "Jerremy Send You a Message",
              message: "hello your package has almost arrived, are you at home now?",
              time: "9:25 AM",
              hasAction: true,
              actionTextAccept: "yes",
              actionTextReject: "No",
              onActionAccept: () {},
              onActionReject:() {},
            ),

            NotificationCard(
              icon: Icons.local_offer,
              iconColor: Colors.orange,
              title: "Flash Sale!",
              message: "Get 20% discount for first transaction in this week",
              time: "9:15 AM",
              hasAction: false,
            ),
          ],
        ),
      ),
    );
  }
}