import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/log_out_cubit/log_out_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  static Future show(BuildContext context) {
    final LogOutCubit logoutBloc = di<LogOutCubit>();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocProvider.value(
          value: logoutBloc,
          child: AlertDialog(
            title: Center(child: Text('logout'.tr)),
            alignment: Alignment.center,
            content: LogoutDialog(),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              BlocConsumer<LogOutCubit, LogOutState>(
                bloc: logoutBloc,
                listener: (context, state) {
                  if (state.errorMessage != null) {
                    showSnackBar(context, msg: state.errorMessage!);
                  }
                  if (state.successMessage != null) {
                    showSnackBar(context,
                        backgroundColor: AppColors.greanColor,
                        msg: state.successMessage!.tr);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutePath.splashRoute,
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: Text('yes'.tr),
                              onPressed: () {
                                logoutBloc.logOut();
                              },
                            ),
                            TextButton(
                              child: Text('no'.tr),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            'log_out_confirm'.tr,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
