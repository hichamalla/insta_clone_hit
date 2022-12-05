import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone_hit/state/auth/providers/auth_state_provider.dart';
import 'package:insta_clone_hit/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_clone_hit/views/components/dialogs/logout_dialog.dart';
import 'package:insta_clone_hit/views/constants/strings.dart';
import 'package:insta_clone_hit/views/tabs/users_posts/user_posts_view.dart';

// class MainView extends StatelessWidget {
//   const MainView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('')),
//         body: Consumer(
//           builder: (_, ref, child) {
//             return Column(
//               children: [
//                 const DataNotFoundAnimationView(),
//                 TextButton(
//                     onPressed: () async {
//                       await ref.watch(authStateProvider.notifier).logOut();
//                       // LoadingScreen.instance()
//                       //     .show(context: context, text: 'Loading...');
//                     },
//                     child: const Text('Loggout')),
//               ],
//             );
//           },
//         ));
//   }
// }

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.appName,
          ),
          actions: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.film,
              ),
              onPressed: () async {},
            ),
            IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
            ),
            IconButton(
              onPressed: () async {
                final shouldLogOut = await LogoutDialog()
                    .present(context)
                    .then((value) => value ?? false);
                if (shouldLogOut) {
                  ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.home),
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            UserPostsView(),
            UserPostsView(),
            UserPostsView(),
          ],
        ),
      ),
    );
  }
}
