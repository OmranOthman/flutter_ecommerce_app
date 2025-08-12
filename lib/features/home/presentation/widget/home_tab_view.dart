import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/home_vendor_item_widget.dart';
import 'package:flutter_ecommerce_app/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final ValueNotifier<int> carouselIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    carouselIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double carouselHeight = MediaQuery.of(context).size.height * 0.25;
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
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

        return RefreshIndicator(
          onRefresh: () async {
            homeCubit.loadHomeData();
            profileCubit.getMyProfile();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Carousel section (unchanged)
                ValueListenableBuilder<int>(
                  valueListenable: carouselIndexNotifier,
                  builder: (context, currentIndex, _) {
                    return Column(
                      children: [
                        if (state.ads.isNotEmpty) ...[
                          FlutterCarousel.builder(
                            itemCount: state.ads.length,
                            itemBuilder: (context, itemIndex, pageIndex) =>
                                Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 20, end: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: state.ads[itemIndex].media!,
                                  fit: BoxFit.fill,
                                  imageBuilder: (context, imageProvider) =>
                                      Image(image: imageProvider),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: AppColors.greyColor
                                        .withValues(alpha: 0.5),
                                    highlightColor: AppColors.greyLightColor,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            options: CarouselOptions(
                              height: carouselHeight,
                              showIndicator: false,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                carouselIndexNotifier.value = index;
                              },
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              1,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                width: currentIndex == index ? 8 : 6,
                                height: currentIndex == index ? 8 : 6,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ] else ...[
                          SizedBox.shrink()
                        ],
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                if (state.promotions.isNotEmpty) ...[
                  HomeVendorItemWidget(),
                ] else ...[
                  EmptyWidget(
                    message: "no_promotions".tr,
                    icon: Icons.local_offer_outlined,
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
