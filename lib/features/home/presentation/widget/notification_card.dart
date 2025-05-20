import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool hasAction;
  final String? actionTextAccept;
  final String? actionTextReject;
  final VoidCallback? onActionAccept;
  final VoidCallback? onActionReject;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    required this.hasAction,
    this.actionTextAccept,
    this.actionTextReject,
    this.onActionAccept,
    this.onActionReject,
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
            if (hasAction && actionTextAccept != null && actionTextReject != null)
              _buildActionButtons(context),
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
      padding: const EdgeInsets.only(left: 36),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.grey[400],
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onActionReject,
            child: Text(
              actionTextReject!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onActionAccept,
            child: Text(
              actionTextAccept!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}