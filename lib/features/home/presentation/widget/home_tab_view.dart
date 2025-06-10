import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/vendor_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              // Carousel section (unchanged)
              ValueListenableBuilder<int>(
                valueListenable: carouselIndexNotifier,
                builder: (context, currentIndex, _) {
                  return Column(
                    children: [
                      FlutterCarousel.builder(
                        itemCount: state.ads.length,
                        itemBuilder: (context, itemIndex, pageIndex) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                              bottom: 20, end: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: state.ads[itemIndex].media!,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
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
                            margin: const EdgeInsets.symmetric(horizontal: 3),
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
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              ...state.promotions.map((promotion) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        promotion.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: promotion.vendors?.length ?? 0,
                        itemBuilder: (context, index) {
                          final vendor = promotion.vendors?[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: VendorItem(vendor: vendor),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }
}