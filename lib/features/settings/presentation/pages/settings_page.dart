import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_state.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/wallet_cubit/wallet_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/log_out_dialog.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/settings_bottom.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/social_media_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const SettingsPage(),
      );

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<AuthCubit>()),
        BlocProvider(create: (context) => di<WalletCubit>()..getMyWallet()),
        BlocProvider(create: (context) => di<AppSettingsCubit>()..fetchAppSettings()),
      ],
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".trv(context), style: TextStyle(fontSize: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          BlocBuilder<WalletCubit, WalletState>(
            bloc: walletCubit,
            builder: (context, state) {
              if (state.errorMessage != null) {
                return Center(
                  child: IconButton(
                    onPressed: () {
                      walletCubit.getMyWallet();
                    },
                    icon: Icon(Icons.replay_outlined),
                  ),
                );
              }
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(
                    color: Colors.grey.shade800,
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withValues(alpha:0.7),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 24.w,
                            color: Colors.amber.shade300,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "wallet_balance".tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            state.wallet ?? "0.00",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade300,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline, color: Colors.greenAccent),
                            onPressed: () {
                              CustomBottomSheet.show(
                                context: context,
                                child: _RechargeWalletBottomSheet(walletCubit: walletCubit),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
            child: Text("general".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          SettingsBottom(
            icon: Icons.person_outline,
            title: "edit_profile".tr,
            onTap: () =>
                Navigator.pushNamed(context, RoutePath.settingEditProfileRoute),
          ),
          SettingsBottom(
            icon: Icons.lock_outline,
            title: "change_password".tr,
            onTap: () => Navigator.pushNamed(
                context, RoutePath.settingChangePasswordRoute),
          ),
          SettingsBottom(
            icon: Icons.location_on_outlined,
            title: "address".tr,
            onTap: () => Navigator.pushNamed(
              context,
              RoutePath.addressesRoute,
            ),
          ),
          SettingsBottom(
            icon: Icons.notifications_none,
            title: "notifications".tr,
            onTap: () => Navigator.pushNamed(
                context, RoutePath.settingNotificationsRoute),
          ),
          SettingsBottom(
            icon: Icons.security_outlined,
            title: "security".tr,
            onTap: () =>
                Navigator.pushNamed(context, RoutePath.settingSecurityRoute),
          ),
          SettingsBottom(
            icon: Icons.language,
            title: "language".tr,
            // trailingText: selectedLanguage,
            onTap: () async {
              await Navigator.pushNamed(context, RoutePath.languageRoute);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h, bottom: 6.h),
            child: Text("preferences".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          SettingsBottom(
            icon: Icons.policy_outlined,
            title: "legal_and_policies".tr,
            onTap: () => Navigator.pushNamed(
                context, RoutePath.settingLegalAndPoliciesRoute),
          ),
          SettingsBottom(
            icon: Icons.help_outline,
            title: "help_and_support".tr,
            onTap: () =>
                Navigator.pushNamed(context, RoutePath.settingHelpRoute),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return SettingsBottom(
                  icon: Icons.logout,
                  title: 'logout'.tr,
                  isDestructive: true,
                  showArrow: false,
                  onTap: () {
                    LogoutDialog.show(context);
                  });
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final appSettingsCubit = context.read<AppSettingsCubit>();

                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (_) => SocialMediaBottomSheet(appSettingsCubit: appSettingsCubit),
                  );
                },
                child: Text(
                  "follow_us".tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),


            ],
          ),
          SizedBox(height: 50.h,)
        ],
      ),
    );
  }
}

class _RechargeWalletBottomSheet extends StatefulWidget {
  final WalletCubit walletCubit;
  const _RechargeWalletBottomSheet({required this.walletCubit});

  @override
  State<_RechargeWalletBottomSheet> createState() =>
      _RechargeWalletBottomSheetState();
}

class _RechargeWalletBottomSheetState
    extends State<_RechargeWalletBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("recharge_wallet".tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.h),
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: "enter_code".tr,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "code_required".tr;
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "recharge".tr,
                onTap: isSubmitting
                    ? null
                    : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => isSubmitting = true);
                    await widget.walletCubit
                        .rechargeWallet(code: _codeController.text);
                    setState(() => isSubmitting = false);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("wallet_recharged_successfully".tr),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

