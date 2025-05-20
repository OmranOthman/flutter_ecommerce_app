import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/favorite/presentation/view_model/favorite_cubit/favorite_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (context) {
        final cubit = FavoriteCubit();
        cubit.getFavoriteProducts();
        return cubit;
      },
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favorite",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
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
                child: Text(
                  'No favorite products',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await favoriteCubit.getFavoriteProducts();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: favoriteProducts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.grey2,
                          ),
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                product.category,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocConsumer<FavoriteCubit, FavoriteState>(
                          bloc: favoriteCubit,
                          listenWhen: (previous, current) =>
                          current is FavoriteRemoveError,
                          listener: (context, state) {
                            if (state is FavoriteRemoveError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.error,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              );
                            }
                          },
                          buildWhen: (previous, current) =>
                          (current is FavoriteRemoving &&
                              current.productId == product.id) ||
                              (current is FavoriteRemoved &&
                                  current.productId == product.id) ||
                              current is FavoriteRemoveError,
                          builder: (context, state) {
                            if (state is FavoriteRemoving) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator.adaptive(),
                              );
                            }
                            return IconButton(
                              icon: const Icon(Icons.favorite,
                                  color: AppColors.red),
                              onPressed: () async {
                                await favoriteCubit.removeFavorite(product.id);
                              },
                            );
                          },
                        ),
                      ],
                    ),
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