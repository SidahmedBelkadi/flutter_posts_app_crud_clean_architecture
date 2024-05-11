import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String content;

  const PostItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        title,
        style: const TextStyle(fontSize: 28),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        content,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
