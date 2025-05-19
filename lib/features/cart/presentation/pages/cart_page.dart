import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/widget/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CartCubit();
        cubit.getCartItems();
        return cubit;
      },
      child: const CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  void _showCheckoutBottomSheet(BuildContext context, double subtotal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CheckoutBottomSheet(subtotal: subtotal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemWidget(
                        cartItem: item,
                        isSelected: item.isSelected,
                        onSelect: (selected) {
                          cubit.toggleItemSelection(item.id, selected);
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                  ),
                ),
                _buildCheckoutFooter(context, state.subtotal),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }

  Widget _buildCheckoutFooter(BuildContext context, double subtotal) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTotalRow(context, 'Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildTotalRow(context, 'Shipping', 10.0),
          const Divider(height: 24, color: Colors.black45),
          _buildTotalRow(
            context,
            'Total Amount',
            subtotal + 10,
            isBold: true,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            // child: MainButton(
            //   text: "Checkout",
            //   onTap: () => _showCheckoutBottomSheet(context, subtotal + 10),
            // ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(BuildContext context, String title, double amount,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: AppColors.grey,
              ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }
}

class CheckoutBottomSheet extends StatelessWidget {
  final double subtotal;

  const CheckoutBottomSheet({super.key, required this.subtotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your promo code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                prefixIcon: Icon(Icons.discount)
              ),
            ),
            const SizedBox(height: 32),
            _buildTotalRow(context, 'Subtotal', subtotal),
            const SizedBox(height: 18),
            _buildTotalRow(context, 'Shipping', 10.0),
            const SizedBox(height: 32),
            _buildTotalRow(
              context,
              'Total Amount',
              subtotal + 10,
              isBold: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              // child: MainButton(
              //   text: 'Proceed to Checkout',
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, AppRoutes.checkoutRoute);
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(BuildContext context, String title, double amount,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
