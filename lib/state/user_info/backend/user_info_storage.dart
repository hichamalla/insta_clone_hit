import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart' show immutable;
import 'package:insta_clone_hit/state/constants/firebase_collection_name.dart';
import 'package:insta_clone_hit/state/constants/firebase_field_name.dart';
import 'package:insta_clone_hit/state/posts/typedefs/user_id.dart';
import 'package:insta_clone_hit/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.userCollection,
          )
          .where(FirebaseFiledName.userId, isEqualTo: userId)
          .limit(1)
          .get();
      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFiledName.displayName: displayName,
          FirebaseFiledName.email: email,
        });
        return true;
      }
      final payLaod = UserInfoPayload(
          userId: userId, displayName: displayName, email: email);
      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.userCollection,
          )
          .add(payLaod);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
