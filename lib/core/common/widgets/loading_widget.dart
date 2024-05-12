import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 32,
        width: 32,
        child: CircularProgressIndicator(
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
