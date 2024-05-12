import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CutomFormButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CutomFormButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        child: child,
      ),
    );
  }
}
