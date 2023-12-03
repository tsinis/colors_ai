import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class RemoveBackground extends StatelessWidget {
  final bool _secondary;

  const RemoveBackground.primary({super.key}) : _secondary = false;
  const RemoveBackground.secondary({super.key}) : _secondary = true;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: context.theme.colorScheme.error,
        child: Align(
          alignment: _secondary ? Alignment.centerRight : Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(Icons.delete_forever, color: Colors.white70),
          ),
        ),
      );
}
