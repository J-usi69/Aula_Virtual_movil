//lib/features/dashboard/ui/dashboard_avatar.dart

import 'package:flutter/material.dart';

class DashboardAvatar extends StatelessWidget {
  final String? photoUrl;
  final String name;

  const DashboardAvatar({
    super.key,
    required this.photoUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final initials =
        name.length >= 2
            ? name.substring(0, 2).toUpperCase()
            : name.substring(0, 1).toUpperCase();

    if (photoUrl != null && photoUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey.shade300,
        child: ClipOval(
          child: Image.network(
            photoUrl!,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildInitials(initials);
            },
          ),
        ),
      );
    }

    return _buildInitials(initials);
  }

  Widget _buildInitials(String initials) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.black,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
