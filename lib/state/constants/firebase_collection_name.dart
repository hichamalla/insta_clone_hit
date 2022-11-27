import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName {
  static const thumbnailsCollection = 'thumbnails';
  static const commentCollection = 'comments';
  static const likesCollection = 'likes';
  static const userCollection = 'users';
  static const postCollection = 'posts';

  const FirebaseCollectionName._();
}
