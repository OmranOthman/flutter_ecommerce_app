import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/widget/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(dummyCart.toString());
    return BlocProvider(
        create: (context) {
          final cubit = CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: const CartView());
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = BlocProvider.of<CartCubit>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is CartLoaded ||
              current is CartLoading ||
              current is CartError,
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is CartLoaded) {
              final cartItems = state.cartItems;
              if (cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'No items in your cart!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return CartItemWidget(cartItem: cartItem);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.grey2,
                        );
                      },
                    ),
                    Divider(
                      color: AppColors.grey2,
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      bloc: cubit,
                      buildWhen: (previous, current) =>
                      current is SubtotalUpdated,
                      builder: (context, subtotalState) {
                        if (subtotalState is SubtotalUpdated) {
                          return Column(
                            children: [
                              _buildTotalRow(context,
                                  title: 'Subtotal',
                                  amount: subtotalState.subtotal),
                              _buildTotalRow(context,
                                  title: 'Shipping', amount: 10),
                              const SizedBox(height: 4),
                              Dash(
                                dashColor: AppColors.grey3,
                                length: MediaQuery.of(context).size.width - 32,
                              ),
                              const SizedBox(height: 4),
                              _buildTotalRow(
                                context,
                                title: 'Total Amount',
                                amount: subtotalState.subtotal + 10,
                                isTotal: true,
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            _buildTotalRow(context,
                                title: 'Subtotal', amount: state.subtotal),
                            _buildTotalRow(context,
                                title: 'Shipping', amount: 10),
                            const SizedBox(height: 4),
                            Dash(
                              dashColor: AppColors.grey3,
                              length: MediaQuery.of(context).size.width - 32,
                            ),
                            const SizedBox(height: 4),
                            _buildTotalRow(
                              context,
                              title: 'Total Amount',
                              amount: state.subtotal + 10,
                              isTotal: true,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: CustomButton(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(RoutePath.checkoutRoute);
                          },
                          text:
                            'Checkout',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CartError) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Something went wrong!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
          },
        ),
      );
    });
  }

  Widget _buildTotalRow(BuildContext context,
      {required String title,
        required double amount,
        bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isTotal
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.grey),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: isTotal
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}