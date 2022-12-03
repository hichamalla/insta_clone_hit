import 'package:flutter/material.dart';
import 'package:insta_clone_hit/state/posts/models/post.dart';

class PostThumnailView extends StatelessWidget {
  final Post post;
  final VoidCallback onTapped;
  const PostThumnailView({
    super.key,
    required this.post,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Image.network(
        post.thumbnailUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
