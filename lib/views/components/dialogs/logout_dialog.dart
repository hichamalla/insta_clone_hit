// import 'package:flutter/fondation.dart' show immutable;

import 'package:flutter/foundation.dart' show immutable;
import 'package:insta_clone_hit/views/components/constants/string.dart';
import 'package:insta_clone_hit/views/components/dialogs/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  LogoutDialog()
      : super(
          title: Strings.logOut,
          message: Strings.areYouSureThatYouWantToLogOutOfTheApp,
          buttons: {
            Strings.cancel: false,
            Strings.logOut: true,
          },
        );
}
