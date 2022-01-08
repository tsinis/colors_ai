import 'package:colors_ai/share/mixins/text_based_file_creator.dart';
import 'package:flutter_test/flutter_test.dart';

import 'data.dart';

class _TextBasedFileCreatorTest with TextBasedFileCreator {}

void main() => group(
      '$TextBasedFileCreator',
      () {
        final _TextBasedFileCreatorTest _textFileCreator = _TextBasedFileCreatorTest();

        test('toJson()', () {
          final String json = _textFileCreator.toJson(palette);
          expect(
            json,
            '''
{
  "color-1": "#000000",
  "color-2": "#FFFFFF"
}''',
          );
        });

        test('toScss()', () {
          final String scss = _textFileCreator.toScss(palette);
          expect(
            scss,
            r'''
$color-1: #000000ff;
$color-2: #ffffffff;''',
          );
        });

        test('toSvg()', () {
          final String svg = _textFileCreator.toSvg(palette);
          expect(
            svg,
            '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 100">
      <defs>
        <clipPath id="a">
          <rect width="200" height="100"/>
        </clipPath>
      </defs>
      <g clip-path="url(#a)">
        <rect width="100" height="100" x="0" fill="#000000"/>
        <rect width="100" height="100" x="100" fill="#FFFFFF"/>
      </g>
    </svg>''',
          );
        });
      },
    );
