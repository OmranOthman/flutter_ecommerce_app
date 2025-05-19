import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/widgets/text_field_search.dart';

class SettingHelpAndSupportPage extends StatelessWidget {
  const SettingHelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help and Support",
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
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextFieldSearch(hintText: "Search help topics",),
            const SizedBox(height: 24),

            // Dropdown Items
            _buildDropdownItem(
              title: "Lorem ipsum dolor sit amet",
              content: "Amet minim mollit non deserunt ullamco est sit aliqua",
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Colors.grey,
            ),

            _buildDropdownItem(
              title: "Lorem ipsum dolor sit amet",
              content: "dolor do amet sint. Velit officia consequat duis enim",
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Colors.grey,
            ),
            _buildDropdownItem(
              title: "Lorem ipsum dolor sit amet",
              content: "Lorem ipsum dolor sit amet",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem({required String title, required String content}) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}