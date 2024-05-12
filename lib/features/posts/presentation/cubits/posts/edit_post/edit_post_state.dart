part of 'edit_post_cubit.dart';

sealed class EditPostState extends Equatable {
  const EditPostState();

  @override
  List<Object> get props => [];
}

final class EditPostInitial extends EditPostState {}

final class EditPostLoading extends EditPostState {}

final class EditPostError extends EditPostState {
  final String message;

  const EditPostError({required this.message});

  @override
  List<Object> get props => [message];
}

final class EditPostSuccess extends EditPostState {
  final String message;

  const EditPostSuccess({required this.message});

  @override
  List<Object> get props => [message];
}
