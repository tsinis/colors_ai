import 'package:colors_ai/favorites/blocs/list_favorites/favorites_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data.dart';

void main() {
  test('$FavoritesEvent props', () {
    const FavoritesEvent favsEvent = FavoritesAdded(favorite: colors);
    expect(favsEvent.props, <Object>[colors]);
  });

  test('$FavoritesSeveralRemoved props', () {
    const FavoritesEvent favsEvent = FavoritesSeveralRemoved(<int>{0});
    expect(favsEvent.props, <Object>[
      <int>{0}
    ]);
  });

  test('$FavoritesOneRemoved props', () {
    const FavoritesEvent favsEvent = FavoritesOneRemoved(colorToRemoveIndex: 0);
    expect(favsEvent.props, <Object>[0]);
  });

  test('$FavoritesStarted props', () {
    const FavoritesEvent favsEvent = FavoritesStarted();
    expect(favsEvent.props.isEmpty, true);
  });
}
