import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

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
        if (state.errorMessage!= null){
          return Center(child: Text(state.errorMessage!));
        }
        return SingleChildScrollView(
            child: Column(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: carouselIndexNotifier,
              builder: (context, currentIndex, _) {
                return Column(
                  children: [
                    FlutterCarousel.builder(
                      itemCount: state.ads!.length,
                      itemBuilder: (context, itemIndex, pageIndex) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 20, end: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: state.ads![itemIndex].media!,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'new_arrivals'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'see_all'.tr,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.of(context, rootNavigator: true).pushNamed(
                      RoutePath.productDetailsRoute,
                      arguments: 1,
                    ),
                    // child: ProductItem(productItem: state.products[index]),
                  );
                },
              ),
            ),
          ],
        ));
      },
    );
  }
}
