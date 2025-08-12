import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_cubit.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/app_setting_cubit/app_settings_state.dart';

import '../../../../dependency_Injections.dart';

class LegalAndPoliciesPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const LegalAndPoliciesPage(),
      );

  const LegalAndPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<AppSettingsCubit>()..fetchAppSettings(),
      child: const LegalAndPoliciesView(),
    );
  }
}

class LegalAndPoliciesView extends StatelessWidget {
  const LegalAndPoliciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "legal_and_policies".tr,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          if (state is AppSettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppSettingsLoaded) {
            final termsText = Localizations.localeOf(context).languageCode == 'ar'
                ? state.infoModel.data.terms.ar
                : state.infoModel.data.terms.en;

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "terms".tr,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Html(
                    data: termsText,
                    style: {
                      "p": Style(
                        fontSize: FontSize(14.sp),
                        lineHeight: LineHeight(1.5),
                      ),
                      "li": Style(
                        fontSize: FontSize(14.sp),
                        lineHeight: LineHeight(1.5),
                      ),
                    },
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          } else if (state is AppSettingsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
