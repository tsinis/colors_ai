import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUI {
  static const Brightness _uiBrightness = Brightness.dark;
  static const Color _uiColor = Colors.grey;

  static Future<void> initUI() async {
    //TODO Lock native splash too.
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _uiColor,
        systemNavigationBarDividerColor: _uiColor,
        systemNavigationBarIconBrightness: _uiBrightness,
        statusBarIconBrightness: _uiBrightness));
  }
}
