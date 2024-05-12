import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/constants/messages.dart';
import 'package:posts_app/core/helpers/failure_to_message.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post_usecase.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  final UpdatePostUseCase updatePostUseCase;
  EditPostCubit({required this.updatePostUseCase}) : super(EditPostInitial());

  Future<void> updatePost({required PostEntity postEntity}) async {
    emit(EditPostLoading());
    final failureOrSuccess = await updatePostUseCase(postEntity: postEntity);
    failureOrSuccess.fold(
        (failure) => emit(EditPostError(message: FailureToMessage.convert(failure: failure))),
        (success) => emit(const EditPostSuccess(message: AppMessages.postUpdated)));
  }
}
