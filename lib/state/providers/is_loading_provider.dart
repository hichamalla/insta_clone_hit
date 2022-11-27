import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/models/auth_state.dart';
import 'package:insta_clone_hit/state/auth/providers/auth_state_provider.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);

    return authState.isLoading;
  },
);
