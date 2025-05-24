import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, size: 24.sp),
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
                    padding: EdgeInsets.all(16.w),
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
                        Divider(color: AppColors.grey2, height: 24.h),
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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: Offset(0, -5.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your promo code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_forward, size: 24.sp),
                onPressed: () {},
              ),
              prefixIcon: Icon(Icons.percent, size: 24.sp),
            ),
          ),
          SizedBox(height: 24.h),
          _buildTotalRow(context, 'Subtotal', subtotal),
          SizedBox(height: 8.h),
          _buildTotalRow(context, 'Shipping', 10.0),
          SizedBox(height: 24.h),
          _buildTotalRow(
            context,
            'Total Amount',
            subtotal + 10,
            isBold: true,
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: "Checkout",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutePath.checkoutRoute);
            },
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
            fontSize: 16.sp,
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
