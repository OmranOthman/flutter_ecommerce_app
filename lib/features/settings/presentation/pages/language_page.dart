import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/presentation/app_bloc/app_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

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
        title: Text('language'.trv(context), style: TextStyle(fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
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

  Widget _langiageListTile({
    required String countryCode,
    required String title,
    required bool selectedLanguage,
    required void Function() onTap,
  }) {
    final flagUrl = 'https://flagcdn.com/w160/${countryCode.toLowerCase()}.png';

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
            child: CachedNetworkImage(
              imageUrl: flagUrl,
              width: 36.w,
              height: 36.h,
              fit: BoxFit.fill,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.language,
                size: 20.sp,
              ),
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
