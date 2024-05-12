import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependecy_injection/service_locator.dart' as service_locator;
import 'core/theme/app_theme.dart';
import 'features/posts/presentation/cubits/posts/delete_post/delete_post_cubit.dart';
import 'features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';
import 'features/posts/presentation/screens/home.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => service_locator.sl<GetPostsCubit>()..getAllPosts(),
          ),
          BlocProvider(
            create: (context) => service_locator.sl<DeletePostCubit>(),
          ),
        ],
        child: MaterialApp(
          theme: darkAppTheme,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ));
  }
}
