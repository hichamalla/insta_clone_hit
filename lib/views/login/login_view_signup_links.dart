import 'package:flutter/material.dart';

import 'package:insta_clone_hit/views/rich_text/base_text.dart';
import 'package:insta_clone_hit/views/rich_text/riche_text_widget.dart';
import 'package:insta_clone_hit/views/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSginupLinks extends StatelessWidget {
  const LoginViewSginupLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleforAll: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
      texts: [
        BaseText.plain(
          text: Strings.dontHaveAnAccount,
        ),
        BaseText.plain(
          text: Strings.signUpOn,
        ),
        BaseText.link(
          text: Strings.facebook,
          onTapped: () {
            launchUrl(
              Uri.parse(
                Strings.facebookSignupUrl,
              ),
            );
          },
        ),
      ],
    );
  }
}
