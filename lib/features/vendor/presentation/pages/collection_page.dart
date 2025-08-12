import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_ad_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_promotion_model/collection_promotion_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_vendors_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/promotion_vendor_model/promotion_vendor_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/pages/vendor_page.dart';
import 'package:flutter_ecommerce_app/features/vendor/presentation/view_model/collection_cubit/collection_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CollectionPage extends StatelessWidget {
  final int collectionId;

  const CollectionPage({super.key, required this.collectionId});

  static Route<dynamic> route({
    required int params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => CollectionPage(
          collectionId: params,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<CollectionCubit>()
        ..loadSubCollections(collectionId)
        ..loadCollectionVendors(collectionId)
        ..loadFilters(),
      child: CollectionView(collectionId: collectionId),
    );
  }
}

class CollectionView extends StatefulWidget {
  final int collectionId;

  const CollectionView({super.key, required this.collectionId});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  int _currentSlide = 0;
  late final CarouselSliderController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionCubit collectionCubit = context.read<CollectionCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        // title: TextField(
        //   controller: searchController,
        //   decoration: InputDecoration(
        //     hintText: 'Search...'.tr,
        //     border: InputBorder.none,
        //     prefixIcon: const Icon(Icons.search),
        //   ),
        // ),
      ),
      body: BlocConsumer<CollectionCubit, CollectionState>(
        listener: (context, state) {
          if (state.errorMessageToggling != null) {
            showSnackBar(context, msg: state.errorMessageToggling!);
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state.errorMessage != null) {
            return ErrorMessageWidget(
              errorMessage: state.errorMessage!,
              onRetry: () {
                collectionCubit
                  ..loadSubCollections(widget.collectionId)
                  ..loadCollectionVendors(widget.collectionId)
                  ..loadFilters();
              },
            );
          }

          // final subCollections = state.collectionDetails?.subCollection ?? [];
          List<CollectionVendorModel>? vendors = state.collectionVendors ?? [];
          List<CollectionAdModel> ads = state.collectionDetails?.ads ?? [];
          List<CollectionPromotionModel> promotions =
              state.collectionDetails?.promotions ?? [];

          return RefreshIndicator(
            onRefresh: () async {
              collectionCubit.loadSubCollections(widget.collectionId);
              collectionCubit.loadCollectionVendors(widget.collectionId);
              collectionCubit.loadFilters();
            },
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    if (state.collectionDetails?.collection != null)
                      Text(
                        state.collectionDetails!.collection!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    SizedBox(height: 16.h),
                    if (ads.isNotEmpty)
                      Column(
                        children: [
                          CarouselSlider(
                            items: ads.map((ad) {
                              String image = ad.image;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CachedNetworkImage(
                                  imageUrl: image,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  placeholder: (_, __) =>
                                      Container(color: Colors.grey[300]),
                                  errorWidget: (_, __, ___) =>
                                      const Icon(Icons.error),
                                ),
                              );
                            }).toList(),
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              //  height: MediaQuery.of(context).size.width * (6 / 19),
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,

                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentSlide = index;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: ads.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _carouselController
                                    .animateToPage(entry.key),
                                child: Container(
                                  width:
                                      _currentSlide == entry.key ? 12.w : 8.w,
                                  height: 8.h,
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentSlide == entry.key
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    SizedBox(height: 12.h),
                    ...promotions.map((promotion) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(promotion.title!,
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: promotion.vendors!.length,
                              itemBuilder: (context, index2) {
                                PromotionVendorModel vendor =
                                    promotion.vendors![index2];

                                return GestureDetector(
                                  onTap: () {
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              VendorPage(vendorId: vendor.id!),
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 162.w,
                                    height: 255.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 4.h,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: 145.h,
                                              width: 154.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                color: AppColors.grey2,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                child: CachedNetworkImage(
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Image(
                                                          image: imageProvider),
                                                  imageUrl: vendor.brandImage!,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor: AppColors
                                                        .greyColor
                                                        .withValues(alpha: 0.5),
                                                    highlightColor: AppColors
                                                        .greyLightColor,
                                                    child: Container(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Center(
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 8.h,
                                              right: 8.w,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black45,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.w),
                                                  child: InkWell(
                                                    onTap: () {
                                                      collectionCubit
                                                          .toggleFavoriteInPromotion(
                                                              vendorId:
                                                                  vendor.id!,
                                                              promotionId:
                                                                  promotion
                                                                      .id!);
                                                    },
                                                    child: Icon(
                                                      vendor.isFavorite ?? false
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      size: 20,
                                                      color:
                                                          vendor.isFavorite ??
                                                                  false
                                                              ? Colors.red
                                                              : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 154.w,
                                          child: Text(
                                            vendor.name ?? '', // name vendor
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    if (state.isLoading) SizedBox.shrink(),
                    if (vendors.isEmpty)
                      EmptyWidget(
                          message: 'no_vendors_found'.tr,
                          icon: Icons.store_mall_directory),
                    if (vendors.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vendors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          CollectionVendorModel vendor = vendors[index];
                          return _buildVendorCard(vendor);
                        },
                      ),
                  ],
                ),
                if (state.isLoadingToggling)
                  Container(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildVendorCard(CollectionVendorModel vendor) {
    CollectionCubit collectionCubit = context.read<CollectionCubit>();

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutePath.vendorDetailsRoute,
                arguments: vendor.id);
          },
          child: SizedBox(
            width: 154.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: vendor.brandImage!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                      ),
                    )),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    vendor.name!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          right: 15.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black45,
            ),
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: InkWell(
                onTap: () {
                  collectionCubit.toggleFavoriteInCollection(
                    vendorId: vendor.id!,
                  );
                },
                child: Icon(
                  vendor.isFavorite ?? false
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 20,
                  color: vendor.isFavorite ?? false ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
