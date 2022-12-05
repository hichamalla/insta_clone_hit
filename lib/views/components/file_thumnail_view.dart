import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/images_upload/models/thumbnail_request.dart';
import 'package:insta_clone_hit/state/images_upload/providers/thumbnail_provider.dart';
import 'package:insta_clone_hit/views/animations/loading_animation_view.dart';
import 'package:insta_clone_hit/views/animations/small_error_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  const FileThumbnailView({
    required this.thumbnailRequest,
    super.key,
  });
  final ThumbnailRequest thumbnailRequest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(
        thumbnailRequest,
      ),
    );
    return thumbnail.when(
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
    );
  }
}
