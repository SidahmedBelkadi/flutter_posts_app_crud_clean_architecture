import 'package:flutter/material.dart';

abstract class AppDialog {
  static void showDeletePostDialog({
    required BuildContext context,
    void Function()? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure you want to delete this post?"),
          content: const Text("This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
