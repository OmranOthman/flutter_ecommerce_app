import 'package:flutter/material.dart';

class ToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ToggleItem({
    super.key,
    required this.title,
    this.value = true,
    this.onChanged,
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
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return states.contains(MaterialState.selected)
                        ? theme.colorScheme.primary
                        : Colors.grey.shade400;
                  }),
                  trackColor: MaterialStateProperty.resolveWith<Color>((states) {
                    return states.contains(MaterialState.selected)
                        ? theme.colorScheme.primary.withOpacity(0.3)
                        : Colors.grey.shade400.withOpacity(0.5);
                  }),
                ),
              ],
            ),
          ),
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