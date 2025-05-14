import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.confirmMessage,
    required this.onConfirm,
  });
  final String confirmMessage;
  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required String confirmMessage,
    required VoidCallback onConfirm,
  }) =>
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text('Are you sure?',style: Theme.of(context).textTheme.headlineMedium,),
            content: ConfirmDialog(
                confirmMessage: confirmMessage, onConfirm: onConfirm),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () {
                  onConfirm.call();
                    Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      confirmMessage,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
