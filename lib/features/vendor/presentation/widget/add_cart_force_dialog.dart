import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCartForceDialog extends StatelessWidget {
  const AddCartForceDialog({
    super.key,
    required this.confirmMessage,
    required this.onConfirm,
    required this.title,
  });
  final String confirmMessage;
  final String title;
  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required String confirmMessage,
    required String title,
    required VoidCallback onConfirm,
  }) =>
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            content: AddCartForceDialog(
              confirmMessage: confirmMessage,
              onConfirm: onConfirm,
              title: title,
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () => Navigator.pop(context, false),
                child: Text('no'.tr),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () {
                  onConfirm.call();
                  Navigator.pop(context);
                },
                child: Text('yes'.tr),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Column(
        spacing: 5,
        children: [
          Text(
            confirmMessage,
            style: Theme.of(context).textTheme.titleMedium,
          ),
           Text(
            "add_product_condition".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
