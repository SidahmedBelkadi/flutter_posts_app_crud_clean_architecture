import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/local/posts_local_data_source.dart';
import '../datasources/remote/posts_remote_data_source.dart';
import '../models/post.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Unit>> createPost({required PostEntity postEntity}) async {
    return _performActionOnPost(postEntity, remoteDataSource.createPost);
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    return _withNetworkConnectivity(
      onConnected: () async {
        try {
          final remotePosts = await remoteDataSource.getAllPosts();
          localDataSource.cachePosts(posts: remotePosts);
          return Right(remotePosts);
        } on ServerException {
          return Left(ServerFailure());
        }
      },
      onDisconnected: () async => _getPostsFromCache(),
    );
  }

  @override
  Future<Either<Failure, Unit>> updatePost({required PostEntity postEntity}) async {
    return _performActionOnPost(postEntity, remoteDataSource.updatePost);
  }

  @override
  Future<Either<Failure, Unit>> deletePost({required String id}) async {
    return _withNetworkConnectivity(
      onConnected: () async {
        try {
          await remoteDataSource.deletePost(id: id);
          return const Right(unit);
        } catch (e) {
          return Left(ServerFailure());
        }
      },
      onDisconnected: () async => Left(OfflineFailure()),
    );
  }

  //  Helpers -----------------------------------

  Future<Either<Failure, Unit>> _performActionOnPost(
      PostEntity postEntity, Function({required PostModel postModel}) action) async {
    return _withNetworkConnectivity(
      onConnected: () async {
        try {
          final postModel = PostModel.fromEntity(postEntity: postEntity);
          await action(postModel: postModel);
          return const Right(unit);
        } on ServerException {
          return Left(ServerFailure());
        }
      },
      onDisconnected: () async => Left(OfflineFailure()),
    );
  }

  Future<Either<Failure, List<PostEntity>>> _getPostsFromCache() async {
    try {
      final localPosts = await localDataSource.getCachedPosts();
      return Right(localPosts);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, T>> _withNetworkConnectivity<T>(
      {required Future<Either<Failure, T>> Function() onConnected,
      required Future<Either<Failure, T>> Function() onDisconnected}) async {
    if (await networkInfo.isConnected) {
      return onConnected();
    } else {
      return onDisconnected();
    }
  }
}
