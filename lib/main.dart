import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/providers/is_logged_in_provider.dart';
import 'package:insta_clone_hit/state/providers/is_loading_provider.dart';
import 'package:insta_clone_hit/views/components/loading/loading_screen.dart';
import 'firebase_options.dart';
import 'views/login/login_view.dart';
import 'views/main/main_view.dart';

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
            ref.listen<bool>(isLoadingProvider, (_, isLoading) {
              if (isLoading) {
                // isLoading.log();
                LoadingScreen.instance()
                    .show(context: context, text: 'Loading...');
              } else {
                // isLoading.log();
                LoadingScreen.instance().hide();
              }
            });
            var isloggedin = ref.watch(loggedInProvider);
            if (isloggedin) {
              return const MainView();
            } else {
              return const LoginWidget();
            }
          },
        )
        //  const LoginView(),
        );
  }
}


