import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/common/cubits/theme/theme_cubit.dart';
import 'package:posts_app/core/common/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/edit_post/edit_post_cubit.dart';

import 'core/dependecy_injection/service_locator.dart' as service_locator;
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
          create: (_) => ThemeCubit()..getCurrentTheme(),
        ),
        BlocProvider(
          create: (_) => service_locator.sl<GetPostsCubit>()..getAllPosts(),
        ),
        BlocProvider(
          create: (context) => service_locator.sl<DeletePostCubit>(),
        ),
        BlocProvider(
          create: (context) => service_locator.sl<EditPostCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLoaded) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
