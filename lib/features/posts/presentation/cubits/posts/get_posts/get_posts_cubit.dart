import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/helpers/failure_to_message.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  GetPostsCubit({required this.getAllPostsUseCase}) : super(GetPostsInitial());

  getAllPosts() async {
    emit(GetPostsLoading());

    final failureOrPosts = await getAllPostsUseCase();

    failureOrPosts.fold((failure) {
      emit(GetPostsError(message: FailureToMessage.convert(failure: failure)));
    }, (posts) {
      emit(GetPostsLoaded(posts: posts));
    });
  }
}
