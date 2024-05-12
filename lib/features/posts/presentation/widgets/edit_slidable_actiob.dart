import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'edit_post_form.dart';

class EditPostSlidableAction extends StatelessWidget {
  const EditPostSlidableAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          showDragHandle: true,
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const EditPostForm(),
              ),
            );
          },
        );
      },
      backgroundColor: Colors.green.withOpacity(.8),
      icon: Icons.read_more,
    );
  }
}
