import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/widgets/text_field_search.dart';

class SettingHelpAndSupportPage extends StatelessWidget {
  const SettingHelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            const TextFieldSearch(
              hintText: "Search help topics",
            ),
            const SizedBox(height: 24),

            // Dropdown Items
            _buildDropdownItem(
              context,
              title: "Lorem ipsum dolor sit amet",
              content: "Amet minim mollit non deserunt ullamco est sit aliqua",
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Colors.grey,
            ),

            _buildDropdownItem(
              context,
              title: "Lorem ipsum dolor sit amet",
              content: "dolor do amet sint. Velit officia consequat duis enim",
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Colors.grey,
            ),
            _buildDropdownItem(
              context,
              title: "Lorem ipsum dolor sit amet",
              content: "Lorem ipsum dolor sit amet",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(BuildContext context, {required String title, required String content}) {
    final theme = Theme.of(context);

    return ExpansionTile(
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodySmall?.color?.withOpacity(0.7)),
          ),
        ),
      ],
    );
  }
}
