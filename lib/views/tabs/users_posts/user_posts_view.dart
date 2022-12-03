import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:insta_clone_hit/state/posts/providers/user_posts_provider.dart';
import 'package:insta_clone_hit/views/animations/empty_contents_with_text_animation_view.dart';
import 'package:insta_clone_hit/views/animations/error_animation_view.dart';
import 'package:insta_clone_hit/views/animations/loading_animation_view.dart';
import 'package:insta_clone_hit/views/constants/strings.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
        onRefresh: () {
          ref.refresh(userPostsProvider);
          return Future.delayed(const Duration(seconds: 1));
        },
        child: posts.when(
            data: (posts) {
              if (posts.isEmpty) {
                return const EmptyContentsWithTextAnimationView(
                    text: Strings.youHaveNoPosts);
              }
              return Container();
            },
            error: (error, stackTrace) {
              return const ErrorAnimationView();
            },
            loading: () => const LoadingAnimationView()));
  }
}
