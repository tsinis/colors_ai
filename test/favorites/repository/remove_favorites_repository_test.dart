import 'package:colors_ai/favorites/repository/remove_favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$RemoveFavoritesRepository', () {
    late RemoveFavoritesRepository removeFavsRepository;

    setUp(() => removeFavsRepository = RemoveFavoritesRepository(Set<int>.from(<int>{})));

    test('selections', () => expect(removeFavsRepository.selections, <int>{}));

    test('changeSelection()', () {
      expect(removeFavsRepository.selections.isEmpty, true);
      removeFavsRepository.changeSelection(0);
      expect(removeFavsRepository.selections, <int>{0});
      removeFavsRepository.changeSelection(1);
      expect(removeFavsRepository.selections, <int>{0, 1});
      removeFavsRepository.changeSelection(1);
      expect(removeFavsRepository.selections, <int>{0});
    });

    test('clearSelections()', () {
      expect(removeFavsRepository.selections.isEmpty, true);
      removeFavsRepository.changeSelection(0);
      expect(removeFavsRepository.selections, <int>{0});
      removeFavsRepository.changeSelection(1);
      expect(removeFavsRepository.selections, <int>{0, 1});
      removeFavsRepository.clearSelections();
      expect(removeFavsRepository.selections.isEmpty, true);
    });
  });
}
