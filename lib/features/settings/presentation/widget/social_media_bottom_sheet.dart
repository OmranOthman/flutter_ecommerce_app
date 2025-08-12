import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBottomSheet extends StatelessWidget {
  final AppSettingsCubit appSettingsCubit;

  const SocialMediaBottomSheet({
    super.key,
    required this.appSettingsCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      bloc: appSettingsCubit,
      builder: (context, state) {
        if (state is! AppSettingsLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = state.infoModel.data;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('follow_us'.tr, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20.h),
              ListTile(
                leading: const Icon(Icons.facebook_outlined, color: Colors.blue),
                title: const Text("Facebook"),
                onTap: () => _launchUrl(data.facebook),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined, color: Colors.purple),
                title: const Text("Instagram"),
                onTap: () => _launchUrl(data.instagram),
              ),
              ListTile(
                leading: const Icon(Icons.chat_bubble_outline, color: Colors.lightBlue),
                title: const Text("Twitter"),
                onTap: () => _launchUrl(data.twitter),
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, color: Colors.blueAccent),
                title: const Text("LinkedIn"),
                onTap: () => _launchUrl(data.linkedin),
              ),
              ListTile(
                leading: const Icon(Icons.video_library, color: Colors.red),
                title: const Text("YouTube"),
                onTap: () => _launchUrl(data.youtube),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
