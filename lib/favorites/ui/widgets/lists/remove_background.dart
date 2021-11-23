import 'package:flutter/material.dart';

class RemoveBackground extends StatelessWidget {
  const RemoveBackground.primary() : _secondary = false;

  const RemoveBackground.secondary() : _secondary = true;

  final bool _secondary;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).errorColor,
        child: Align(
          alignment: _secondary ? Alignment.centerRight : Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(Icons.delete_forever, color: Colors.white70),
          ),
        ),
      );
}
