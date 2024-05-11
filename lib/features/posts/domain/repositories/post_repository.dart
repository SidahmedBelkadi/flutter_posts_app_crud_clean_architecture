import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, Unit>> createPost({required PostEntity postEntity});

  Future<Either<Failure, List<PostEntity>>> getAllPosts();

  Future<Either<Failure, Unit>> updatePost({required PostEntity postEntity});

  Future<Either<Failure, Unit>> deletePost({required String id});
}
