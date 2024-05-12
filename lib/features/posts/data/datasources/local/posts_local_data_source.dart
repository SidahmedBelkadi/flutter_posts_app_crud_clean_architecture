import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../../core/constants/keys.dart';
import '../../../../../core/error/exception.dart';
import '../../models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostsLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts({required List<PostModel> posts});
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts({required List<PostModel> posts}) async {
    final List<Map<String, dynamic>> jsonPosts =
        posts.map<Map<String, dynamic>>((PostModel postModel) => postModel.toMap()).toList();
    sharedPreferences.setString(AppKeys.cachedPosts, json.encode(jsonPosts));

    return unit;
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final jsonString = sharedPreferences.getString(AppKeys.cachedPosts);
    if (jsonString != null) {
      final List decodedJsonData = json.decode(jsonString);
      final posts = decodedJsonData.map<PostModel>((post) => PostModel.fromMap(post)).toList();
      return Future.value(posts);
    } else {
      throw CacheException();
    }
  }
}
