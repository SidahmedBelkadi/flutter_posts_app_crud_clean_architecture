import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_theme.dart';
import 'package:posts_app/features/posts/presentation/screens/home.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
