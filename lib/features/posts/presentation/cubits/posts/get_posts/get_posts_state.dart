part of 'get_posts_cubit.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class GetPostsInitial extends GetPostsState {}

final class GetPostsLoading extends GetPostsState {}

final class GetPostsError extends GetPostsState {
  final String message;

  const GetPostsError({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetPostsLoaded extends GetPostsState {
  final List<PostEntity> posts;

  const GetPostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}
