import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/presentation/app_bloc/app_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const LanguagePage(),
      );
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageView();
  }
}

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr, style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 20.sp),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1.h,
          ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        bloc: appBloc,
        builder: (context, state) {
          Locale locale = state.locale;
          return ListView(children: [
            _langiageListTile(
              countryCode: "GB",
              selectedLanguage: locale == Locale('en'),
              title: "english",
              onTap: () {
                appBloc.add(AppEvent.changeLanguage(locale: Locale('en')));
              },
            ),
            _langiageListTile(
              countryCode: "OM",
              selectedLanguage: locale == Locale('ar'),
              title: "arabic",
              onTap: () {
                appBloc.add(AppEvent.changeLanguage(locale: Locale('ar')));
              },
            ),
          ]);
        },
      ),
    );
  }

  Widget _langiageListTile(
      {required String countryCode,
      required String title,
      required bool selectedLanguage,
      required void Function() onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: ListTile(
        leading: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: selectedLanguage
                ? Border.all(color: Colors.blue.shade300, width: 1.w)
                : null,
          ),
          child: ClipOval(
            child: Image.network(
              'https://flagcdn.com/w160/${countryCode.toLowerCase()}.png',
              width: 36.w,
              height: 36.h,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.language, size: 20.sp),
            ),
          ),
        ),
        title: Text(
          title.tr,
          style: TextStyle(fontSize: 14.sp),
        ),
        trailing: selectedLanguage
            ? Icon(Icons.check, color: Colors.blue, size: 20.sp)
            : null,
        onTap: onTap,
      ),
    );
  }
}
