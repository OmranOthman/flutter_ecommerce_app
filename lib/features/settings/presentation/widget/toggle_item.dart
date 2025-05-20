import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool isLast;

  const ToggleItem({
    super.key,
    required this.title,
    this.value = true,
    this.onChanged,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium,
                ),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => states.contains(MaterialState.selected)
                        ? theme.colorScheme.primary
                        : Colors.grey.shade400,
                  ),
                  trackColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => states.contains(MaterialState.selected)
                        ? theme.colorScheme.primary.withOpacity(0.3)
                        : Colors.grey.shade400.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          if (!isLast)
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
