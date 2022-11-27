import 'dart:collection' show MapView;
import 'package:flutter/foundation.dart' show immutable;
import 'package:insta_clone_hit/state/constants/firebase_field_name.dart';
import 'package:insta_clone_hit/state/posts/typedefs/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFiledName.userId: userId,
            FirebaseFiledName.displayName: displayName ?? '',
            FirebaseFiledName.email: email ?? '',
          },
        );
}
