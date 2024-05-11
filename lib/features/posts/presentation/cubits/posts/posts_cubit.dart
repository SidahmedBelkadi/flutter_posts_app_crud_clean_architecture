import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/helpers/failure_to_message.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  PostsCubit({required this.getAllPostsUseCase}) : super(PostsInitial());

  getAllPosts() async {
    emit(PostsLoading());

    final failureOrPosts = await getAllPostsUseCase();

    failureOrPosts.fold((failure) {
      emit(PostsError(message: FailureToMessage.convert(failure: failure)));
    }, (posts) {
      emit(PostsLoaded(posts: posts));
    });
  }
}
