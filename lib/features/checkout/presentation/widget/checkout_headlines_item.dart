import 'package:flutter/material.dart';

class CheckoutHeadlinesItem extends StatelessWidget {
  final String title;
  final int? numOfProducts;
  final VoidCallback? onTap;
  const CheckoutHeadlinesItem({
    super.key,
    required this.title,
    this.numOfProducts,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (numOfProducts != null) ...[
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    '($numOfProducts)',
                    style: textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (onTap != null)
          TextButton(
            onPressed: onTap,
            child: Text(
              'Edit',
              style: textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
