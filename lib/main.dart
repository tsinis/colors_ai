import 'package:flutter/material.dart';

import 'services/ui/system_overlays.dart';
import 'ui/screens/main_screen.dart';

void main() {
  setupSystemUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) =>
      MaterialApp(theme: ThemeData(primarySwatch: Colors.grey), home: const MainScreen());
}
