import 'dart:ui' show Color;

import 'package:colors_ai/favorites/models/color_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import '../../data/mocks/generated.mocks.dart';
import '../data.dart';

void main() => group('$ColorAdapter', () {
      final ColorAdapter adapter = ColorAdapter();
      test('typeId', () => expect(adapter.typeId, 200));

      test('read()', () {
        final BinaryReader mockedReader = MockBinaryReader();
        verifyZeroInteractions(mockedReader);
        when<int>(mockedReader.readInt()).thenAnswer((_) => 0);
        final Color color = adapter.read(mockedReader);
        verify(mockedReader.readInt()).called(1);
        expect(color, transparentColor);
        verifyNoMoreInteractions(mockedReader);
      });

      test('write()', () {
        final BinaryWriter mockedWriter = MockBinaryWriter();
        verifyZeroInteractions(mockedWriter);
        adapter.write(mockedWriter, transparentColor);
        verify(mockedWriter.writeInt(0)).called(1);
        verifyNoMoreInteractions(mockedWriter);
      });
    });
