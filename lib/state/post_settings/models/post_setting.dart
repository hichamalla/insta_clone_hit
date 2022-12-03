import 'package:insta_clone_hit/state/post_settings/constants/constants.dart';

enum PostSetting {
  allowLikes(
    title: Strings.allowLikesTitle,
    discription: Strings.allowLikesDescription,
    storageKey: Strings.allowLikesStorageKey,
  ),
  allowComments(
    title: Strings.allowCommentsTitle,
    discription: Strings.allowCommentsDescription,
    storageKey: Strings.allowCommentsStorageKey,
  );

  final String title;
  final String discription;
  final String storageKey;
  const PostSetting({
    required this.title,
    required this.discription,
    required this.storageKey,
  });
}
