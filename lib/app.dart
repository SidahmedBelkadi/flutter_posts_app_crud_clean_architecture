import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_theme.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const Scaffold(
        body: Center(
          child: Text("Hello World, Posts App with clean architecture"),
        ),
      ),
    );
  }
}
