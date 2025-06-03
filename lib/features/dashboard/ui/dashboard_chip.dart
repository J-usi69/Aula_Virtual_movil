//lib/features/dashboard/ui/dashboard_chip.dart

import 'package:flutter/material.dart';

class DashboardChip extends StatelessWidget {
  final String label;

  const DashboardChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
