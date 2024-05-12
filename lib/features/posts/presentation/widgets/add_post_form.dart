import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/custom_form_field.dart';
import '../../../../core/common/widgets/loading_widget.dart';
import '../../../../core/utils/toast.dart';
import '../../domain/entities/post.dart';
import '../cubits/posts/create_post/create_post_cubit.dart';
import '../cubits/posts/get_posts/get_posts_cubit.dart';
import 'custom_form_button.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({super.key});

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  final GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _contentTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.of(context).pop();
          context.read<GetPostsCubit>().getAllPosts();
          AppToasts.showSuccessToast(message: state.message, context: context);
        }
        if (state is CreatePostError) {
          AppToasts.showErrorToast(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _addPostFormKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomFormField(
                  hintText: 'Title',
                  textEditingController: _titleTextEditingController,
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  hintText: 'Content',
                  minLines: 3,
                  maxLines: 7,
                  textEditingController: _contentTextEditingController,
                ),
                const SizedBox(height: 32.0),
                CutomFormButton(
                  onPressed: () => _validateAndAddPost(),
                  child: state is CreatePostLoading ? const LoadingWidget() : const Text("Create"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validateAndAddPost() {
    final isValidated = _addPostFormKey.currentState!.validate();
    if (isValidated) {
      final postEntity = PostEntity(
        id: null,
        title: _titleTextEditingController.text.trim(),
        content: _contentTextEditingController.text.trim(),
      );
      context.read<CreatePostCubit>().createPost(postEntity: postEntity);
    }

    return;
  }
}
