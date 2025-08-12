import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../dependency_Injections.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<AppSettingsCubit>()..fetchAppSettings(),
      child: const HelpAndSupportView(),
    );
  }
}

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("help_and_support".tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            if (state is AppSettingsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppSettingsLoaded) {
              final info = state.infoModel.data;
              return ListView(
                children: [
                  _buildInfoCard(
                    context,
                    icon: Icons.email_outlined,
                    title: "email".tr,
                    content: info.email ?? "-",
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoCard(
                    context,
                    icon: Icons.phone_outlined,
                    title: "phone".tr,
                    content: info.phone ?? "-",
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoCard(
                    context,
                    icon: Icons.location_on_outlined,
                    title: "address".tr,
                    content: info.address ?? "-",
                  ),
                ],
              );
            } else if (state is AppSettingsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24.sp, color: theme.primaryColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  content,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
