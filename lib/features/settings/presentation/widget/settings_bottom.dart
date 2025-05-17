import 'package:flutter/material.dart';

class SettingsBottom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;
  final bool isDestructive;
  final bool showArrow; // ✅ أضفنا الخاصية هنا

  const SettingsBottom({
    Key? key,
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
    this.isDestructive = false,
    this.showArrow = true, // ✅ القيمة الافتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : Colors.black;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: const TextStyle(color: Colors.grey),
              ),
            if (showArrow) const SizedBox(width: 8), // ✅ شرط العرض
            if (showArrow)
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey), // ✅ شرط السهم
          ],
        ),
      ),
    );
  }
}
