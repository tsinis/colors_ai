import 'package:colors_ai/favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class RemoveFavoritesEventTest extends RemoveFavoritesEvent {}

void main() {
  test('$RemoveFavoritesEvent props', () {
    final RemoveFavoritesEvent aboutEvent = RemoveFavoritesEventTest();
    expect(aboutEvent.props.isEmpty, true);
  });

  test('$RemoveFavoritesSelected props', () {
    const RemoveFavoritesEvent aboutEvent = RemoveFavoritesSelected(1);
    expect(aboutEvent.props, const <int>[1]);
  });
}
