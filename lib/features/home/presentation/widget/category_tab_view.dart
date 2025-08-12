import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.errorMessage != null) {
          return ErrorMessageWidget(
            errorMessage: state.errorMessage!,
            onRetry: () {
              homeCubit.loadHomeData();
              profileCubit.getMyProfile();
            },
          );
        }

        if (state.collections.isEmpty) {
          return EmptyWidget(
            message: "no_collections".tr,
            icon: Icons.collections_outlined,
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            homeCubit.loadHomeData();
            profileCubit.getMyProfile();
          },
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            itemCount: state.collections.length,
            itemBuilder: (context, index) {
              final collection = state.collections[index];
              final isEvenId = collection.id != null && collection.id! % 2 == 0;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: InkWell(
                  onTap: () {
                    if (collection.id != null) {
                      Navigator.pushNamed(context, RoutePath.collectionRoute,
                          arguments: collection.id!);
                    }
                  },
                  child: SizedBox(
                    height: 150.h,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: CachedNetworkImage(
                            imageUrl: collection.media!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            // Shimmer.fromColors(
                            //   baseColor:
                            //       AppColors.greyColor.withValues(alpha: 0.5),
                            //   highlightColor: AppColors.greyLightColor,
                            //   child: Container(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor:
                                  AppColors.greyColor.withValues(alpha: 0.5),
                              highlightColor: AppColors.greyLightColor,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.image, size: 50),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: isEvenId
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w)
                                .copyWith(bottom: 12.h),
                            child: Text(
                              collection.title ?? 'No Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
