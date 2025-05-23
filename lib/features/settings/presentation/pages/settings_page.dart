import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/widget/settings_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: const Text("Settings", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.withOpacity(0.3), height: 1),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 8),
            child: Text("General", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SettingsBottom(
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingEditProfileRoute);
            },
          ),
          SettingsBottom(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingChangePasswordRoute);
            },
          ),
          SettingsBottom(
            icon: Icons.notifications_none,
            title: "Notifications",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingNotificationsRoute);
            },
          ),
          SettingsBottom(
            icon: Icons.security_outlined,
            title: "Security",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingSecurityRoute);
            },
          ),
          SettingsBottom(
            icon: Icons.language,
            title: "Language",
            trailingText: selectedLanguage,
            onTap: () async {
              await Navigator.pushNamed(context, RoutePath.settingLanguageRoute);
              onLanguageChanged(); // Refresh language after returning
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 14, bottom: 6),
            child: Text("Preferences", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SettingsBottom(
            icon: Icons.policy_outlined,
            title: "Legal and Policies",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingLegalAndPoliciesRoute);
            },
          ),
          SettingsBottom(
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () {
              Navigator.pushNamed(context, RoutePath.settingHelpRoute);
            },
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
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _logoutDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                  //  await cubit.logout();
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
