import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/widget/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselIndexNotifier = ValueNotifier<int>(0);

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      buildWhen: (previous, current) =>
      current is HomeLoaded ||
          current is HomeLoading ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: carouselIndexNotifier,
                  builder: (context, currentIndex, _) {
                    return Column(
                      children: [
                        FlutterCarousel.builder(
                          itemCount: state.carouselItems.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Padding(
                                padding: const EdgeInsetsDirectional.only(bottom: 20, end: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: state.carouselItems[itemIndex].imgUrl,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator.adaptive(),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            height: 200,
                            showIndicator: false,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              carouselIndexNotifier.value = index;
                            },
                          ),
                        ),
                        const SizedBox(height: 6), // Reduced spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.carouselItems.length,
                                (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.symmetric(horizontal: 3), // Reduced margin
                              width: currentIndex == index ? 8 : 6, // Smaller circles
                              height: currentIndex == index ? 8 : 6, // Smaller circles
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
                const SizedBox(height: 20.0), // Reduced spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0), // Reduced padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New Arrivals 🔥',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GridView.builder(
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.56,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () =>
                            Navigator.of(context, rootNavigator: true).pushNamed(
                              AppRoutes.productDetailsRoute,
                              arguments: state.products[index].id,
                            ),
                        child: ProductItem(
                          productItem: state.products[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}