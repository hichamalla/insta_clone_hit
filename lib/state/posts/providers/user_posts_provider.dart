import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/constants/firebase_collection_name.dart';
import 'package:insta_clone_hit/state/constants/firebase_field_name.dart';
import 'package:insta_clone_hit/state/posts/models/post_key.dart';

import '../../auth/providers/user_id_provider.dart';
import '../models/post.dart';

final userPostsProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
  final controller = StreamController<Iterable<Post>>();
  controller.onListen = () {
    controller.sink.add([]);
  };

  final userId = ref.watch(userIdProvider);
  final sub = FirebaseFirestore.instance
      .collection(
        FirebaseCollectionName.postCollection,
      )
      .orderBy(
        FirebaseFiledName.createdAt,
        descending: true,
      )
      .where(
        PostKey.userId,
        isEqualTo: userId,
      )
      .snapshots()
      .listen((
    snapshot,
  ) {
    final documents = snapshot.docs;
    final posts = documents
        .where(
          (doc) => !doc.metadata.hasPendingWrites,
        )
        .map(
          (doc) => Post(
            postId: doc.id,
            json: doc.data(),
          ),
        );
    controller.sink.add(posts);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
