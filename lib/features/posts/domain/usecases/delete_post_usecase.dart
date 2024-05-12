import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/post_repository.dart';

class DeletePostsUseCase {
  final PostsRepository repository;

  DeletePostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String id}) async {
    return await repository.deletePost(id: id);
  }
}
