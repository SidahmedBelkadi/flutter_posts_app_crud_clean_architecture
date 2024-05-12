import 'package:flutter/material.dart';

abstract class AppSnackbar {
  static void showSuccessSnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showErrorSnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
