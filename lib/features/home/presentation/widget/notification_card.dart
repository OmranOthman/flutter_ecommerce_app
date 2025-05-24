import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool hasAction;


  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    required this.hasAction,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildMessage(context),
                    ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 36),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.grey[400],
          height: 1.4,
        ),
      ),
    );
  }

}
