import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/settings_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageName = prefs.getString('selected_language_name');
    if (languageName != null) {
      setState(() {
        selectedLanguage = languageName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthCubit>(),
      child: SettingsView(
        selectedLanguage: selectedLanguage,
        onLanguageChanged: _loadSelectedLanguage,
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  final String selectedLanguage;
  final VoidCallback onLanguageChanged;

  const SettingsView({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert, size: 22.sp), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1.h),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
            child: Text("General", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          ),
          SettingsBottom(
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingEditProfileRoute),
          ),
          SettingsBottom(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingChangePasswordRoute),
          ),
          SettingsBottom(
            icon: Icons.notifications_none,
            title: "Notifications",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingNotificationsRoute),
          ),
          SettingsBottom(
            icon: Icons.security_outlined,
            title: "Security",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingSecurityRoute),
          ),
          SettingsBottom(
            icon: Icons.language,
            title: "Language",
            trailingText: selectedLanguage,
            onTap: () async {
              await Navigator.pushNamed(context, RoutePath.settingLanguageRoute);
              onLanguageChanged();
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h, bottom: 6.h),
            child: Text("Preferences", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          ),
          SettingsBottom(
            icon: Icons.policy_outlined,
            title: "Legal and Policies",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingLegalAndPoliciesRoute),
          ),
          SettingsBottom(
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () => Navigator.pushNamed(context, RoutePath.settingHelpRoute),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return SettingsBottom(
                icon: Icons.logout,
                title: 'Logout',
                isDestructive: true,
                showArrow: false,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => _logoutDialog(context),
                ),
              );
            },
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _logoutDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 150.w,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                    ),
                    child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    // await cubit.logout();
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              icon: Icon(Icons.close, size: 20.sp),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
