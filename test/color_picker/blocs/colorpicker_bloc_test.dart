import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/color_picker/blocs/colorpicker_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_clipboard.dart';
import '../data.dart';

void main() {
  const List<ColorPickerEvent> events = <ColorPickerEvent>[
    ColorPickerShowed(),
    ColorPickerHided(),
    ColorPickerCopied(color),
  ];

  group('$ColorPickerBloc', () {
    blocTest<ColorPickerBloc, ColorPickerState>('on Initial', build: ColorPickerBloc.new, expect: () => isEmpty);

    for (final ColorPickerEvent event in events) {
      blocTest<ColorPickerBloc, ColorPickerState>(
        '${event.runtimeType}',
        build: () => ColorPickerBloc(clipboard: FakeClipboard()),
        act: (ColorPickerBloc bloc) => bloc.add(event),
        expect: () => <TypeMatcher<ColorPickerState>>[
          if (event is ColorPickerShowed) isA<ColorPickerOpenInitial>() else isA<ColorPickerCloseInitial>(),
        ],
      );
    }

    blocTest<ColorPickerBloc, ColorPickerState>(
      '$ColorPickerCopied with $Exception',
      build: () => ColorPickerBloc(clipboard: FakeClipboard(throwExceptionOnCopy: true)),
      act: (ColorPickerBloc bloc) => bloc.add(const ColorPickerCopied(color)),
      expect: () => <TypeMatcher<ColorPickerState>>[isA<ColorPickerFailure>(), isA<ColorPickerCloseInitial>()],
    );
  });
}
