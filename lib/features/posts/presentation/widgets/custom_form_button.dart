import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CutomFormButton extends StatelessWidget {
  const CutomFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        child: const Text(
          "Create",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
