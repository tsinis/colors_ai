import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Ignored because it's mocked in tests.
// ignore: implementation_imports
import 'package:window_size/src/window_size_channel.dart';

import '../../../core/ui/constants.dart';

class SystemUI {
  final double _height;
  final WindowSizeChannel? _sizeChannel;
  final double _width;
  final double _windowsHeightCompensation;
  final String _windowTitle;

  const SystemUI({
    double height = 554,
    WindowSizeChannel? sizeChannel,
    double width = 344,
    double windowsHeightCompensation = 146,
    String windowTitle = kAppName,
  })  : _height = height,
        _sizeChannel = sizeChannel,
        _width = width,
        _windowsHeightCompensation = windowsHeightCompensation,
        _windowTitle = windowTitle;

  bool init() {
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
      try {
        (_sizeChannel ?? WindowSizeChannel.instance)
          ..setWindowTitle(_windowTitle)
          ..setWindowMinSize(
            Size(_width, _height + (Platform.isWindows ? _windowsHeightCompensation : 0)),
          );

        return true;
      } catch (_) {
        return false;
      }
    }

    return false;
  }
}
