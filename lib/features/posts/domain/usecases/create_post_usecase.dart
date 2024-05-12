import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class AddPostUseCase {
  final PostsRepository repository;

  AddPostUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required PostEntity postEntity}) async {
    return await repository.createPost(postEntity: postEntity);
  }
}
