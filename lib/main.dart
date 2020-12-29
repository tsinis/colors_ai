import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'colors_bloc_observer.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/main_tab.dart';

void main() {
  Bloc.observer = ColorBlocObserver();
  setupSystemUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) =>
      MaterialApp(theme: ThemeData(primarySwatch: Colors.grey), home: const MainScreen());
}
