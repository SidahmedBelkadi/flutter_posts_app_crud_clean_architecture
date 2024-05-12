part of 'create_post_cubit.dart';

sealed class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostLoading extends CreatePostState {}

final class CreatePostSuccess extends CreatePostState {
  final String message;

  const CreatePostSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class CreatePostError extends CreatePostState {
  final String message;

  const CreatePostError({required this.message});
  @override
  List<Object> get props => [message];
}
