import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'edit_post_form.dart';

class EditPostSlidableAction extends StatelessWidget {
  final VoidCallback onPressed;
  final PostEntity post;
  const EditPostSlidableAction({
    super.key,
    required this.onPressed,
    required this.post,
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
                child: EditPostForm(post: post),
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
