import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const FavoritesPage(),
      );

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (context) => di<FavoriteCubit>()..getFavorite(),
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteCubit favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "my_favorites".tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return ErrorMessageWidget(
              errorMessage: state.errorMessage!,
              onRetry: () {
                favoriteCubit.getFavorite();
              },
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Wrap(
                  spacing: 12.w,
                  children: [
                    ChoiceChip(
                      label: Text(
                        'products'.tr,
                        style: TextStyle(
                          color: state.section == Section.products
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: state.section == Section.products,
                      selectedColor: Theme.of(context).primaryColor,
                      onSelected: (_) {
                        favoriteCubit.switchTab(Section.products);
                      },
                      backgroundColor: Colors.grey[200],
                      showCheckmark: false,
                    ),
                    ChoiceChip(
                      label: Text(
                        'vendors'.tr,
                        style: TextStyle(
                          color: state.section == Section.vendors
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: state.section == Section.vendors,
                      selectedColor: Theme.of(context).primaryColor,
                      onSelected: (_) {
                        favoriteCubit.switchTab(Section.vendors);
                      },
                      backgroundColor: Colors.grey[200],
                      showCheckmark: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                    onRefresh: () async => favoriteCubit.getFavorite(),
                    child: Stack(
                      children: [
                        state.section == Section.products
                            ? listOfProducts(context)
                            : listOfVendors(context),
                        if (state.isLoadingToggling)
                          Container(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget listOfProducts(
    BuildContext context,
  ) {
    FavoriteCubit favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    if (favoriteCubit.state.products!.isEmpty) {
      return EmptyWidget(
        message: "no_favorite_products".tr,
        icon: Icons.heart_broken_outlined,
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: favoriteCubit.state.products!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutePath.productDetailsRoute,
              arguments: favoriteCubit.state.products![index].id,
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170.h,
                    width: 154.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.grey2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CachedNetworkImage(
                        imageUrl:
                            favoriteCubit.state.products![index].media ?? '',
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black45,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: BlocBuilder<FavoriteCubit, FavoriteState>(
                          bloc: favoriteCubit,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                favoriteCubit.toggleFavorite(
                                  type: "product",
                                  id: state.products![index].id!,
                                  index: index,
                                );
                              },
                              child: Icon(
                                state.products![index].isFavorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 24.sp,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                favoriteCubit.state.products![index].name ?? '',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listOfVendors(
    BuildContext context,
  ) {
    FavoriteCubit favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    if (favoriteCubit.state.vendors!.isEmpty) {
      return EmptyWidget(
        message: "no_favorite_vendors".tr,
        icon: Icons.store_outlined,
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: favoriteCubit.state.vendors!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutePath.vendorDetailsRoute,
              arguments: favoriteCubit.state.vendors![index].id,
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170.h,
                    width: 154.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.grey2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CachedNetworkImage(
                        imageUrl:
                            favoriteCubit.state.vendors![index].media ?? '',
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black26,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: BlocBuilder<FavoriteCubit, FavoriteState>(
                          bloc: favoriteCubit,
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                favoriteCubit.toggleFavorite(
                                  type: "vendor",
                                  id: state.vendors![index].id!,
                                  index: index,
                                );
                              },
                              child: Icon(
                                state.vendors![index].isFavorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 20.r,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                favoriteCubit.state.vendors![index].name ?? '',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
