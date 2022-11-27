import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/backend/authenticator.dart';
import 'package:insta_clone_hit/state/auth/providers/auth_state_provider.dart';
import 'package:insta_clone_hit/state/auth/providers/is_logged_in_provider.dart';
import 'package:insta_clone_hit/views/components/loading/loading_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'name-here',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer(
          builder: (context, ref, child) {
            var isloggedin = ref.watch(loggedInProvider);
            if (isloggedin)
              return MainView();
            else
              return LoginView();
          },
        )
        //  const LoginView(),
        );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Consumer(
          builder: (_, ref, child) {
            return TextButton(
                onPressed: () async {
                  // await ref.watch(authStateProvider.notifier).logOut();
                  LoadingScreen.instance()
                      .show(context: context, text: 'Loading...');
                },
                child: Text('Loggout'));
          },
        ));
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login view'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return Column(
              children: [
                TextButton(
                    onPressed: () async {
                      final res = await ref
                          .watch(authStateProvider.notifier)
                          .logginWithGoogle();
                      // res.log();
                    },
                    child: const Text("google sign in")),
                TextButton(
                  child: const Text('click'),
                  onPressed: () async {
                    final res = await ref
                        .watch(authStateProvider.notifier)
                        .logginWithFacebook();
                    // res.log();
                  },
                ),
              ],
            );
          },
        ));
  }
}
