import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';

import '../../../core/ui/constants.dart';

class SystemUI {
  const SystemUI();
  static const Brightness _uiBrightness = Brightness.dark;
  static const Color _uiColor = Colors.grey;

  static void init() {
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
      setWindowTitle(appName);
      setWindowMinSize(const Size(344, 554));
    }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _uiColor,
        systemNavigationBarDividerColor: _uiColor,
        systemNavigationBarIconBrightness: _uiBrightness,
        statusBarIconBrightness: _uiBrightness));
  }
}
