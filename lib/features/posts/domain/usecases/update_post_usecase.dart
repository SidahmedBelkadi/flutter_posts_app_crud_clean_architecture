import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required PostEntity postEntity}) async {
    return await repository.updatePost(postEntity: postEntity);
  }
}
