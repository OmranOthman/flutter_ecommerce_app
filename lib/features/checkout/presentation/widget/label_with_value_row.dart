import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class LabelWithValueRow extends StatelessWidget {
  final String label;
  final String value;
  const LabelWithValueRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    final labelFontSize = isSmallScreen ? 12.0 : 14.0;
    final valueFontSize = isSmallScreen ? 14.0 : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 4 : 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
                fontSize: labelFontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: valueFontSize,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
