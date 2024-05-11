import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:posts_app/core/helpers/dialog.dart';
import 'package:posts_app/features/posts/presentation/widgets/edit_post_form.dart';
import 'package:posts_app/features/posts/presentation/widgets/post_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 12,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
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
            ),
            SlidableAction(
              onPressed: (context) => AppDialog.showDeletePostDialog(context: context),
              backgroundColor: Colors.red.withOpacity(.8),
              icon: Icons.delete,
            ),
          ]),
          child: const PostItem(title: "test", content: "Content"),
        );
      },
      separatorBuilder: (__, _) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
