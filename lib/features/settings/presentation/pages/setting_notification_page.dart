import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/toggle_item.dart';

class SettingNotificationPage extends StatelessWidget {
  const SettingNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: ListView(
        children: const [
          ToggleItem(
            title: "Payment",
            value: false,
          ),
          ToggleItem(title: "Tracking"),
          ToggleItem(title: "Complete Order"),
          ToggleItem(title: "Notification"),
        ],
      ),
    );
  }
}
