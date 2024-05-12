import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/constants/messages.dart';
import '../../../../../../core/helpers/failure_to_message.dart';
import '../../../../domain/entities/post.dart';
import '../../../../domain/usecases/create_post_usecase.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final AddPostUseCase addPostUseCase;
  CreatePostCubit({required this.addPostUseCase}) : super(CreatePostInitial());

  Future<void> createPost({required PostEntity postEntity}) async {
    emit(CreatePostLoading());
    final failureOrSuccess = await addPostUseCase(postEntity: postEntity);
    failureOrSuccess.fold(
        (failure) => emit(CreatePostError(message: FailureToMessage.convert(failure: failure))),
        (success) => emit(const CreatePostSuccess(message: AppMessages.postCreated)));
  }
}
