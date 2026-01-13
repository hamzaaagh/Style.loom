import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String message,
  required bool state,
}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor:
        state ? Colors.green.shade600 : Colors.red.shade600,
    margin: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Row(
      children: [
        Icon(
          state ? Icons.check_circle : Icons.delete_forever,
          color: Colors.white,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}
