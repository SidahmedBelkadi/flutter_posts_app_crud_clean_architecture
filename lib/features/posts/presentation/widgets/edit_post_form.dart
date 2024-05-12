import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/common/widgets/custom_form_field.dart';
import 'package:posts_app/core/common/widgets/loading_widget.dart';
import 'package:posts_app/core/utils/toast.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/edit_post/edit_post_cubit.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';
import 'package:posts_app/features/posts/presentation/widgets/custom_form_button.dart';

class EditPostForm extends StatefulWidget {
  final PostEntity post;
  const EditPostForm({super.key, required this.post});

  @override
  State<EditPostForm> createState() => _EditPostFormState();
}

class _EditPostFormState extends State<EditPostForm> {
  final GlobalKey<FormState> _editPostFormKey = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _contentTextEditingController = TextEditingController();

  @override
  void initState() {
    _titleTextEditingController.text = widget.post.title;
    _contentTextEditingController.text = widget.post.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPostCubit, EditPostState>(
      listener: (context, state) {
        if (state is EditPostError) {
          AppToasts.showErrorToast(message: state.message, context: context);
        }

        if (state is EditPostSuccess) {
          Navigator.of(context).pop();
          context.read<GetPostsCubit>().getAllPosts();
          AppToasts.showSuccessToast(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _editPostFormKey,
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
                  child: state is EditPostLoading ? const LoadingWidget() : const Text("Update"),
                  onPressed: () => _validateAndEditPost(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validateAndEditPost() {
    final isValidated = _editPostFormKey.currentState!.validate();
    if (isValidated &&
        (_titleTextEditingController.text.trim() != widget.post.title ||
            _contentTextEditingController.text.trim() != widget.post.content)) {
      final postEntity = PostEntity(
        id: widget.post.id,
        title: _titleTextEditingController.text.trim(),
        content: _contentTextEditingController.text.trim(),
      );
      context.read<EditPostCubit>().updatePost(postEntity: postEntity);
    }

    return;
  }
}
