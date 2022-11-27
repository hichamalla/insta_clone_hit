import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/models/auth_result.dart';

import 'package:insta_clone_hit/state/auth/providers/auth_state_provider.dart';



final loggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
