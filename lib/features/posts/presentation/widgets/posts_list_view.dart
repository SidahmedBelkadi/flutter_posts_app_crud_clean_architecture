import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:posts_app/core/common/widgets/simple_error_widget.dart';
import 'package:posts_app/core/utils/snackbar.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/delete_post/delete_post_cubit.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';

import '../../domain/entities/post.dart';
import 'delete_slidable_action.dart';
import 'edit_slidable_actiob.dart';
import 'post_item.dart';

class PostsListView extends StatelessWidget {
  final List<PostEntity> posts;
  const PostsListView({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletePostCubit, DeletePostState>(
      builder: (context, state) {
        if (state is DeletePostError) {
          return SimpleErrorWidget(message: state.message);
        }
        return PostsList(posts: posts);
      },
      listener: (BuildContext context, DeletePostState state) {
        if (state is DeletePostSuccess) {
          context.read<GetPostsCubit>().getAllPosts();
          AppSnackbar.showSuccessSnackBar(message: state.message, context: context);
        }
      },
    );
  }
}

class PostsList extends StatelessWidget {
  const PostsList({
    super.key,
    required this.posts,
  });

  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final PostEntity post = posts[index];
        return Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            const EditPostSlidableAction(),
            DeletePostSlidableAction(
              onPressed: () {
                context.read<DeletePostCubit>().deletePost(postId: post.id);
                Navigator.of(context).pop();
              },
            ),
          ]),
          child: PostItem(title: post.title, content: post.content),
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
