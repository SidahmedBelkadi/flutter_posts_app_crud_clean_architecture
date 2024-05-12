import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class AppToasts {
  static void showSuccessToast({required String message, required BuildContext context}) {
    toastification.show(
      context: context,
      title: const Text('Yeaa!'),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      showProgressBar: false,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
    );
  }

  static void showErrorToast({required String message, required BuildContext context}) {
    toastification.show(
      context: context,
      title: const Text('Oops!'),
      description: Text(message),
      autoCloseDuration: const Duration(seconds: 5),
      showProgressBar: false,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
    );
  }
}
