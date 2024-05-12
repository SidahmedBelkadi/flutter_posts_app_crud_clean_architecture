import 'package:flutter/material.dart';

class CustomAppBottomSheet extends StatelessWidget {
  final Widget child;
  const CustomAppBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }
}
