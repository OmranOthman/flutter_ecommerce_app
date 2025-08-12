import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
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
            title:  Text(title,style: Theme.of(context).textTheme.titleSmall,),
            content: ConfirmDialog(
                confirmMessage: confirmMessage, onConfirm: onConfirm, title: title,),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () => Navigator.pop(context, false),
                child:  Text('no'.tr),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () {
                  onConfirm.call();
                    Navigator.pop(context);
                },
                child:  Text('yes'.tr),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      confirmMessage,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
