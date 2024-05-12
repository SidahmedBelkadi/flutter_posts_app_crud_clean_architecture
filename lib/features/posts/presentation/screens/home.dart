import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/toast.dart';
import '../cubits/posts/create_post/create_post_cubit.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../../../../core/common/widgets/loading_widget.dart';
import '../../../../core/common/widgets/simple_error_widget.dart';
import '../../../../core/constants/messages.dart';
import '../cubits/posts/get_posts/get_posts_cubit.dart';
import '../widgets/add_post_form.dart';
import '../widgets/posts_list_view.dart';
import '../../../../core/dependecy_injection/service_locator.dart' as service_locator;

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
              return CustomAppBottomSheet(
                child: BlocProvider(
                  create: (context) => service_locator.sl<CreatePostCubit>(),
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
        child: BlocConsumer<GetPostsCubit, GetPostsState>(
          builder: (context, state) {
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
          listener: (BuildContext context, GetPostsState state) {
            if (state is GetPostsError) {
              AppToasts.showErrorToast(message: state.message, context: context);
            }
          },
        ),
      ),
    );
  }
}
