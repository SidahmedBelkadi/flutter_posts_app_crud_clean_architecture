import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/constants/api.dart';
import 'package:posts_app/core/error/exception.dart';
import 'package:posts_app/features/posts/data/models/post.dart';
import 'package:http/http.dart' as http;

abstract class PostsRemoteDataSource {
  Future<Unit> createPost({required PostModel postModel});

  Future<List<PostModel>> getAllPosts();

  Future<Unit> updatePost({required PostModel postModel});

  Future<Unit> deletePost({required String id});
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final http.Client client;

  PostsRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> createPost({required PostModel postModel}) async {
    final body = postModel.toJsonWithoutId();
    final response = await client.post(Uri.parse(kPostsEndpoint), body: body, headers: kHeaders);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(kPostsEndpoint), headers: kHeaders);

    if (response.statusCode == 200) {
      final List rawData = json.decode(response.body);
      final List<PostModel> posts = rawData.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost({required PostModel postModel}) async {
    final response = await client.put(Uri.parse("$kPostsEndpoint/${postModel.id}"),
        body: postModel.toJsonWithoutId(), headers: kHeaders);

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost({required String id}) async {
    final respose = await client.delete(Uri.parse("$kPostsEndpoint/$id"), headers: kHeaders);
    if (respose.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
