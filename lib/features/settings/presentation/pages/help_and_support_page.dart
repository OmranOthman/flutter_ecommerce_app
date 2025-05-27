import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/views/widgets/text_field_search.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text("help_and_support".tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TextFieldSearch(hintText: "search_help_topics".tr),
            SizedBox(height: 24.h),

            _buildDropdownItem(
              context,
              title: "Lorem ipsum dolor sit amet",
              content: "Amet minim moll it non underused McCull och est sit aliquot",
            ),
            Divider(
              height: 32.h,
              thickness: 1.h,
              color: Colors.grey,
            ),

            _buildDropdownItem(
              context,
              title: "Lorem ipsum dolor sit amet",
              content: "dolor do amet saint. Veldt official consequent dues enum",
            ),
            Divider(
              height: 32.h,
              thickness: 1.h,
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
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 13.sp,
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
