import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/constants/messages.dart';
import '../../../../../../core/helpers/failure_to_message.dart';
import '../../../../domain/usecases/delete_post_usecase.dart';

part 'delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  final DeletePostsUseCase deletePostsUseCase;
  DeletePostCubit({required this.deletePostsUseCase}) : super(DeletePostInitial());

  Future<void> deletePost({required String postId}) async {
    emit(DeletePostLoading());
    final failureOrSuccess = await deletePostsUseCase(id: postId);

    failureOrSuccess.fold(
        (failure) => emit(DeletePostError(message: FailureToMessage.convert(failure: failure))),
        (succeess) => emit(const DeletePostSuccess(message: AppMessages.postDeleted)));
  }
}
