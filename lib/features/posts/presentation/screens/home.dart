import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/common/widgets/loading_widget.dart';
import 'package:posts_app/core/common/widgets/simple_error_widget.dart';
import 'package:posts_app/core/constants/messages.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';
import 'package:posts_app/features/posts/presentation/widgets/add_post_form.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            showDragHandle: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddPostForm(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<GetPostsCubit, GetPostsState>(
          builder: (context, state) {
            if (state is GetPostsError) {
              return SimpleErrorWidget(message: state.message);
            }
            if (state is GetPostsLoading) {
              return const LoadingWidget();
            }
            if (state is GetPostsLoaded) {
              return RefreshIndicator(
                onRefresh: () async => context.read<GetPostsCubit>().getAllPosts(),
                child: PostsListView(posts: state.posts),
              );
            }

            return const SimpleErrorWidget(message: AppMessages.unknownError);
          },
        ),
      ),
    );
  }
}
