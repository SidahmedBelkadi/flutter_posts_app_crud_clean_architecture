import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase({required this.repository});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.getAllPosts();
  }
}
