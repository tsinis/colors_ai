import 'dart:ui';

import 'package:colors_ai/app/theme/services/system_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:platform_info/platform_info.dart';
import 'package:window_size/src/window_size_channel.dart';

import '../../../data/mocks/generated.mocks.dart';

void main() => group('$SystemUI', () {
      final WindowSizeChannel mockedWindowSize = MockWindowSizeChannel();
      const double windowsHeightCompensation = 0;
      const double dimension = 1;
      const String windowTitle = 'title';
      const Size size = Size.square(dimension);

      late SystemUI systemUi;

      setUp(() {
        reset(mockedWindowSize);
        systemUi = SystemUI(
          windowsHeightCompensation: windowsHeightCompensation,
          sizeChannel: mockedWindowSize,
          windowTitle: windowTitle,
          height: dimension,
          width: dimension,
        );
      });

      test('init()', () {
        verifyZeroInteractions(mockedWindowSize);
        final bool isSizeChanged = systemUi.init();
        if (platform.isMobile) {
          expect(isSizeChanged, false);
        } else {
          verify(mockedWindowSize.setWindowTitle(windowTitle)).called(1);
          verify(mockedWindowSize.setWindowMinSize(size)).called(1);
          verifyNoMoreInteractions(mockedWindowSize);
          expect(isSizeChanged, true);
        }
      });

      test('init() with $Exception', () {
        verifyZeroInteractions(mockedWindowSize);
        when<void>(mockedWindowSize.setWindowTitle(windowTitle)).thenThrow('Cannot set window title.');
        final bool isSizeChanged = systemUi.init();
        expect(isSizeChanged, false);
      });
    });
