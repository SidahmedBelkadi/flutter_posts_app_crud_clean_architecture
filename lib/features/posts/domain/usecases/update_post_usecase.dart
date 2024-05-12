import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required PostEntity postEntity}) async {
    return await repository.updatePost(postEntity: postEntity);
  }
}
