// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show VoidCallback, immutable;

import 'package:insta_clone_hit/views/rich_text/base_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback onTapped;
   const LinkText({
    required this.onTapped,
    required super.text,
    super.style,
  });
}
