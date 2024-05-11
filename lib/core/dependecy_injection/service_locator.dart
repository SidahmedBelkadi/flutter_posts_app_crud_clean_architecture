import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/features/posts/data/datasources/local/posts_local_data_source.dart';
import 'package:posts_app/features/posts/data/datasources/remote/posts_remote_data_source.dart';
import 'package:posts_app/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/posts_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ------ Blocs & Cubits -----
  sl.registerFactory(() => PostsCubit(getAllPostsUseCase: sl()));

  // ------ UseCases -----
  sl.registerLazySingleton(() => GetAllPostsUseCase(repository: sl()));

  // ------ Repositories -----
  sl.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  // ------ Repositories -----
  sl.registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PostsRemoteDataSourceImpl>(
      () => PostsRemoteDataSourceImpl(client: sl()));

  // ------ Core -----
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));

  // ------ External -----

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
