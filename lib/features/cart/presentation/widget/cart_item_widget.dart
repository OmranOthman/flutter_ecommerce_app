import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/views/widgets/counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel cartItem;
  final bool isSelected;
  final Function(bool) onSelect;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (value) => onSelect(value ?? false),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 0),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(
            cartItem.product.imgUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  text: 'Size: ',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: cartItem.size.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterWidget(
                    value: cartItem.quantity,
                    cartItem: cartItem,
                    cubit: cubit,
                  ),
                  Text(
                    '\$${(cartItem.quantity * cartItem.product.price).toStringAsFixed(2)}',
                    style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}