import '../blocs/navigation_bloc.dart';

mixin NavTabIndexer {
  int get colorsGenTabIndex => NavigationState.generate.index;
  int get favoritesTabIndex => NavigationState.favorites.index;
  int get shareTabIndex => NavigationState.share.index;
}
