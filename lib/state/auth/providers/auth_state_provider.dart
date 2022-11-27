import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/models/auth_state.dart';

import '../notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);

