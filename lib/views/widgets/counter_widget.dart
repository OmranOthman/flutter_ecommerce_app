import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final String? productId;
  final AddToCartModel? cartItem;
  final dynamic cubit;
  final int? initialValue;

  const CounterWidget({
    super.key,
    required this.value,
    this.productId,
    this.cartItem,
    required this.cubit,
    this.initialValue,
  }) : assert(productId != null || cartItem != null);

  Future<void> decrementCounter(dynamic param) async {
    if (initialValue != null) {
      await cubit.decrementCounter(param, initialValue);
    } else {
      await cubit.decrementCounter(param);
    }
  }

  Future<void> incrementCounter(dynamic param) async {
    if (initialValue != null) {
      await cubit.incrementCounter(param, initialValue);
    } else {
      await cubit.incrementCounter(param);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 110,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => cartItem != null
                            ? decrementCounter(cartItem)
                            : decrementCounter(productId),
                        child: Center(
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 42,
                    alignment: Alignment.center,
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => cartItem != null
                            ? incrementCounter(cartItem)
                            : incrementCounter(productId),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Available in stock',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

}
