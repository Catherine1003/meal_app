import 'package:flutter/material.dart';

extension SizeBoxHelpers on double {
  SizedBox get hSpace => SizedBox(height: this);
  SizedBox get wSpace => SizedBox(width: this);
}

extension SnackBarHelpers on BuildContext {
  void showSnackBar(String message, [bool error = false]) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Row(
          children: [
            if (error) ...[
              const Icon(
                Icons.error_outline_rounded,
                color: Colors.red,
              ),
            ] else ...[
              const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.lightGreen,
              ),
            ],
            const SizedBox(
              width: 10,
            ),
            Expanded(child: Text(message)),
          ],
        ),
        behavior: SnackBarBehavior.floating));
  }
}
