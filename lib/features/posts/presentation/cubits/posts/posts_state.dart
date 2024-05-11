part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});

  @override
  List<Object> get props => [message];
}

final class PostsSuccess extends PostsState {
  final String message;

  const PostsSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class PostsLoaded extends PostsState {
  final List<PostEntity> posts;

  const PostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}
