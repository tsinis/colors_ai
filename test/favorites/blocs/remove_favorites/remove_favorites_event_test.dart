import 'package:colors_ai/favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: avoid-top-level-members-in-tests, for now, migrate to freezed and remove TODO.
class RemoveFavoritesEventTest extends RemoveFavoritesEvent {
  const RemoveFavoritesEventTest();
}

void main() {
  test('$RemoveFavoritesEvent props', () {
    const RemoveFavoritesEvent removeFavsEvent = RemoveFavoritesEventTest();
    expect(removeFavsEvent.props.isEmpty, true);
  });

  test('$RemoveFavoritesSelected props', () {
    const RemoveFavoritesEvent removeFavsEvent = RemoveFavoritesSelected(1);
    expect(removeFavsEvent.props, const <int>[1]);
  });
}
