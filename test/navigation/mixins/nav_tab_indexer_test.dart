import 'package:colors_ai/navigation/mixins/nav_tab_indexer.dart';
import 'package:flutter_test/flutter_test.dart';

class _NavTabIndexerTest with NavTabIndexer {}

void main() => group('$NavTabIndexer', () {
      final _NavTabIndexerTest navTabIndexer = _NavTabIndexerTest();
      test('shareTabIndex', () => expect(navTabIndexer.shareTabIndex, 0));
      test('colorsGenTabIndex', () => expect(navTabIndexer.colorsGenTabIndex, 1));
      test('favoritesTabIndex', () => expect(navTabIndexer.favoritesTabIndex, 2));
    });
