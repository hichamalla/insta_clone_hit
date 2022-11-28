// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show VoidCallback, immutable;
import 'package:flutter/material.dart' show TextStyle, Colors, TextDecoration;
import 'package:insta_clone_hit/views/components/rich_text/link_text.dart';

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  BaseText({
    required this.text,
    this.style,
  });

  factory BaseText.plain({
    required String text,
    TextStyle? style = const TextStyle(),
  }) =>
      BaseText(
        text: text,
        style: style,
      );
  factory BaseText.link(
          {required String text,
          required VoidCallback onTapped,
          TextStyle? style = const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          )}) =>
      LinkText(
        text: text,
        onTapped: onTapped,
        style: style,
      );
}
