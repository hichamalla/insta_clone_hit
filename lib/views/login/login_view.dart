import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/views/constants/app_colors.dart';
// import 'package:insta_clone_hit/views/components/constants/string.dart';
import 'package:insta_clone_hit/views/constants/strings.dart';
import 'package:insta_clone_hit/views/login/divider_with_margin.dart';
import 'package:insta_clone_hit/views/login/facebook_button.dart';
import 'package:insta_clone_hit/views/login/google_button.dart';
import 'package:insta_clone_hit/views/login/login_view_signup_links.dart';

import '../../state/auth/providers/auth_state_provider.dart';

class LoginWidget extends ConsumerWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const DividerWithWidget(),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.5),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor,
                  ),
                  onPressed:
                      ref.watch(authStateProvider.notifier).logginWithFacebook,
                  child: const FacebookButton()),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor,
                  ),
                  onPressed:
                      ref.watch(authStateProvider.notifier).logginWithGoogle,
                  child: const GoogleButton()),
              const DividerWithWidget(), 
              const LoginViewSginupLinks()
            ],
          ),
        ),
      ),
    );
  }
}
