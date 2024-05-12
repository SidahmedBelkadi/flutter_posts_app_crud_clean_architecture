import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_theme.dart';
import 'package:posts_app/features/posts/presentation/cubits/posts/get_posts/get_posts_cubit.dart';
import 'package:posts_app/features/posts/presentation/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependecy_injection/service_locator.dart' as service_locator;

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => service_locator.sl<GetPostsCubit>()..getAllPosts(),
        child: const HomeScreen(),
      ),
    );
  }
}
