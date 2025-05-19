import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:flutter_ecommerce_app/features/new_cart/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class EmptyShippingAndPayment extends StatelessWidget {
  final String title;
  final bool isPayment;
  const EmptyShippingAndPayment({
    super.key,
    required this.title,
    required this.isPayment,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    final paymentCubit = BlocProvider.of<PaymentMethodsCubit>(context);

    return InkWell(
      onTap: () {
        if (isPayment) {
          Navigator.of(context)
              .pushNamed(RoutePath.addNewCardRoute, arguments: paymentCubit)
              .then(
                (value) async => await checkoutCubit.getCheckoutContent(),
              );
        } else {
          Navigator.of(context).pushNamed(RoutePath.chooseLocation);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey3,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            children: [
              const Icon(
                Icons.add,
                size: 30,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
