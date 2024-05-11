import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class DeletePostsUseCase {
  final PostsRepository repository;

  DeletePostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String id}) async {
    return await repository.deletePost(id: id);
  }
}
