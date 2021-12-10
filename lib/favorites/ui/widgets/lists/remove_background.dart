import 'package:flutter/material.dart';

class RemoveBackground extends StatelessWidget {
  final bool _secondary;

  const RemoveBackground.primary({Key? key})
      : _secondary = false,
        super(key: key);

  const RemoveBackground.secondary({Key? key})
      : _secondary = true,
        super(key: key);

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
