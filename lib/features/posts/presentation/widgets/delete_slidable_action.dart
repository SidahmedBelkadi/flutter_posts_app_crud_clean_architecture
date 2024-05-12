import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/utils/dialog.dart';

class DeletePostSlidableAction extends StatelessWidget {
  final VoidCallback onPressed;
  const DeletePostSlidableAction({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => AppDialog.showDeletePostDialog(
        context: context,
        onPressed: onPressed,
      ),
      backgroundColor: Colors.red.withOpacity(.8),
      icon: Icons.delete,
    );
  }
}
