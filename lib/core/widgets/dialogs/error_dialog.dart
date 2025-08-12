     
    import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.errorMessage,
   
    required this.title,
  });
  final String errorMessage;
  final String title;


  static Future<void> show(
    BuildContext context, {
    required String errorMessage,
    required String title,
   
  }) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            
            title:  Text(title,style: Theme.of(context).textTheme.titleSmall,),
            content: ErrorDialog(
                errorMessage: errorMessage,  title: title,),
            actions: <Widget>[
               TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ok'.tr),
                            ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
 
     
     
   