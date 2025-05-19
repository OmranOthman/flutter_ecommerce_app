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
      elevation: 0, // إزالة الظل
      color: Colors.transparent, // جعل الخلفية شفافة
      margin: EdgeInsets.zero, // إزالة الهوامش
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // إزالة حواف مدورة
        side: BorderSide.none, // إزالة الحدود
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildMessage(),
            if (hasAction && actionTextAccept != null && actionTextReject != null)
              _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          time,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.grey[700],
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onActionReject,
            child: Text(
              actionTextReject!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onActionAccept,
            child: Text(
              actionTextAccept!,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}