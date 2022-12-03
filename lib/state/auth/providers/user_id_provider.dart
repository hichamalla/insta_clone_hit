import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:insta_clone_hit/state/auth/providers/auth_state_provider.dart';
import 'package:insta_clone_hit/state/posts/typedefs/user_id.dart';


final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
