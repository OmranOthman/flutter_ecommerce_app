import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) {
            final cubit = FavoriteCubit();
            cubit.getFavoriteProducts();
            return cubit;
          },
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favorites",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.notificationRoute);
            },
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
            ),
          ),        ],
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        bloc: favoriteCubit,
        buildWhen: (previous, current) =>
        current is FavoriteLoaded ||
            current is FavoriteLoading ||
            current is FavoriteError,
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is FavoriteLoaded) {
            final favoriteProducts = state.favoriteProducts;
            if (favoriteProducts.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border,
                        size: 60, color: AppColors.grey),
                    const SizedBox(height: 16),
                    Text('No favorites yet',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Tap the heart icon to add products',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await favoriteCubit.getFavoriteProducts();
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return _FavoriteProductItem(
                    product: product,
                    onRemove: () => favoriteCubit.removeFavorite(product.id),
                  );
                },
              ),
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _FavoriteProductItem extends StatelessWidget {
  final ProductItemModel product;
  final VoidCallback onRemove;

  const _FavoriteProductItem({
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              width: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: product.imgUrl,
                  fit: BoxFit.contain,
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
            Positioned(
              top: 8.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: BlocConsumer<FavoriteCubit, FavoriteState>(
                    listener: (context, state) {
                      if (state is FavoriteRemoveError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is FavoriteRemoving &&
                          state.productId == product.id) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return InkWell(
                        onTap: onRemove,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          product.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          product.category,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${product.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}