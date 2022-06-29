import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/color_picker/blocs/colorpicker_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_clipboard.dart';
import '../data.dart';

void main() => group('$ColorPickerBloc', () {
      const List<ColorPickerEvent> events = <ColorPickerEvent>[
        ColorPickerEvent.showed(),
        ColorPickerEvent.hided(),
        ColorPickerEvent.copied(color),
      ];

      blocTest<ColorPickerBloc, ColorPickerState>('on Initial', build: ColorPickerBloc.new, expect: () => isEmpty);

      for (final ColorPickerEvent event in events) {
        blocTest<ColorPickerBloc, ColorPickerState>(
          '$event',
          build: () => ColorPickerBloc(clipboard: FakeClipboard()),
          act: (ColorPickerBloc bloc) => bloc.add(event),
          expect: () => <ColorPickerState>[
            event.maybeWhen(
              showed: ColorPickerState.open,
              orElse: ColorPickerState.close,
            ),
          ],
        );
      }

      blocTest<ColorPickerBloc, ColorPickerState>(
        '$ColorPickerEvent.copied() with $Exception',
        build: () => ColorPickerBloc(clipboard: FakeClipboard(throwExceptionOnCopy: true)),
        act: (ColorPickerBloc bloc) => bloc.add(const ColorPickerEvent.copied(color)),
        expect: () => <ColorPickerState>[const ColorPickerState.failure(), const ColorPickerState.close()],
      );
    });
