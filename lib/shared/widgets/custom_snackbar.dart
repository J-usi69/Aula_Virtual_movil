//lib/shared/witdgets/custom_snackbar.dart

import 'package:flutter/material.dart';

void showCustomSnackbar(
  BuildContext context,
  String message, {
  required bool isSuccess,
}) {
  final color = isSuccess ? Colors.green : Colors.red;
  final icon = isSuccess ? Icons.check_circle : Icons.error;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
