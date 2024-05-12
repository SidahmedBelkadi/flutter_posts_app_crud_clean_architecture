import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/posts/data/datasources/local/posts_local_data_source.dart';
import '../../features/posts/data/datasources/remote/posts_remote_data_source.dart';
import '../../features/posts/data/repositories/posts_repository_impl.dart';
import '../../features/posts/domain/repositories/post_repository.dart';
import '../../features/posts/domain/usecases/create_post_usecase.dart';
import '../../features/posts/domain/usecases/delete_post_usecase.dart';
import '../../features/posts/domain/usecases/get_all_posts_use_case.dart';
import '../../features/posts/presentation/cubits/posts/create_post/create_post_cubit.dart';
import '../../features/posts/presentation/cubits/posts/delete_post/delete_post_cubit.dart';
import '../../features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ------ Blocs & Cubits -----
  sl.registerFactory(() => GetPostsCubit(getAllPostsUseCase: sl()));
  sl.registerFactory(() => DeletePostCubit(deletePostsUseCase: sl()));
  sl.registerFactory(() => CreatePostCubit(addPostUseCase: sl()));

  // ------ UseCases -----
  sl.registerLazySingleton(() => GetAllPostsUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeletePostsUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddPostUseCase(repository: sl()));

  // ------ Repositories -----
  sl.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  // ------ DataSources -----
  sl.registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImpl(client: sl()));

  // ------ Core -----
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));

  // ------ External -----

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
