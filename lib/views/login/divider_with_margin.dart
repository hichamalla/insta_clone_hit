import 'package:flutter/material.dart';

class DividerWithWidget extends StatelessWidget {
  const DividerWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 40.0,
        ),
        Divider(),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
