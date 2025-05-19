import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/features/product_details/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/views/widgets/counter_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
      current is ProductDetailsLoading ||
          current is ProductDetailsLoaded ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        } else if (state is ProductDetailsLoaded) {
          return ProductDetailsView(product: state.product);
        } else {
          return const Scaffold(
            body: Center(child: Text('Something went wrong!')),
          );
        }
      },
    );
  }
}


class ProductDetailsView extends StatelessWidget {
  final ProductItemModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Product Details'),
        actions: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, favState) {
              final favoriteCubit = context.read<FavoriteCubit>();
              final isFavorite = favoriteCubit.favoriteProducts
                  .any((favProduct) => favProduct.id == product.id);

              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.red,
                ),
                onPressed: () async {
                  if (isFavorite) {
                    await favoriteCubit.removeFavorite(product.id);
                  } else {
                    favoriteCubit.favoriteProducts.add(product);
                    // favoriteCubit.emit(FavoriteLoaded(favoriteCubit.favoriteProducts));
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.52,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.grey2),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                CachedNetworkImage(
                  imageUrl: product.imgUrl,
                  height: size.height * 0.4,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.47),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndCounter(context, cubit),
                    const SizedBox(height: 16),
                    _buildSizeSelector(context, cubit),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildDescription(product.description),
                    const Spacer(),
                    _buildBottomRow(context, cubit),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndCounter(BuildContext context, ProductDetailsCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.yellow, size: 22),
                const SizedBox(width: 5),
                Text(product.averageRate.toString(), style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is QuantityCounterLoaded || current is ProductDetailsLoaded,
          builder: (context, state) {
            if (state is QuantityCounterLoaded) {
              return CounterWidget(
                value: state.value,
                productId: product.id,
                cubit: cubit,
              );
            } else if (state is ProductDetailsLoaded) {
              return CounterWidget(
                value: 1,
                productId: product.id,
                cubit: cubit,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  Widget _buildSizeSelector(BuildContext context, ProductDetailsCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is SizeSelected || current is ProductDetailsLoaded,
          builder: (context, state) {
            return Row(
              children: ProductSize.values
                  .map(
                    (size) => Padding(
                  padding: const EdgeInsets.only(top: 6.0, right: 8.0),
                  child: InkWell(
                    onTap: () => cubit.selectSize(size),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state is SizeSelected && state.size == size
                            ? Theme.of(context).primaryColor
                            : AppColors.grey2,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          size.name,
                          style: TextStyle(
                            color: state is SizeSelected && state.size == size
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    bool isExpanded = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isExpanded
                  ? description
                  : description.length > 100
                  ? '${description.substring(0, 100)}...'
                  : description,
              style: const TextStyle(color: AppColors.black45),
            ),
            if (description.length > 100)
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Show Less' : 'Read More',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildBottomRow(BuildContext context, ProductDetailsCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is QuantityCounterLoaded || current is ProductDetailsLoaded,
          builder: (context, state) {
            final total = cubit.totalPrice;
            return Text.rich(
              TextSpan(
                text: '\$ ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                children: [
                  TextSpan(
                    text: total.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is ProductAddedToCart || current is ProductAddingToCart,
          builder: (context, state) {
            if (state is ProductAddingToCart) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                child: const CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductAddedToCart) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                child: const Text('Added To Cart'),
              );
            }
            return ElevatedButton.icon(
              onPressed: () {
                if (cubit.selectedSize != null) {
                  cubit.addToCart(product.id);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select size'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
              ),
              label: const Text('Add to Cart', style: TextStyle(color: AppColors.white70)),
              icon: const Icon(Icons.shopping_bag_outlined),
            );
          },
        ),
      ],
    );
  }
}
