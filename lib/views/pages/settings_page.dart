import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/bottom/settings_bottom.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 8),
              child: Text("General",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SettingsBottom(
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.editProfileRoute);
              },
            ),
            SettingsBottom(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),
            SettingsBottom(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationsRoute);
              },
            ),
            SettingsBottom(
              icon: Icons.security_outlined,
              title: "Security",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.securityRoute);
              },
            ),
            SettingsBottom(
              icon: Icons.language,
              title: "Language",
              trailingText: "English",
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14, bottom: 6),
              child: Text("Preferences",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SettingsBottom(
              icon: Icons.policy_outlined,
              title: "Legal and Policies",
              onTap: () {},
            ),
            SettingsBottom(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),
            BlocConsumer<AuthCubit, AuthState>(
              bloc: cubit,
              listenWhen: (previous, current) =>
                  current is AuthLoggedOut || current is AuthLogOutError,
              listener: (context, state) {
                if (state is AuthLoggedOut) {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil(
                          AppRoutes.loginRoute, (route) => false);
                } else if (state is AuthLogOutError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              buildWhen: (previous, current) => current is AuthLoggingOut,
              builder: (context, state) {
                if (state is AuthLoggingOut) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                return SettingsBottom(
                  icon: Icons.logout,
                  title: 'Logout',
                  isDestructive: true,
                  showArrow: false,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    await cubit.logout();
                                  },
                                  child: const Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                    ),
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
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
