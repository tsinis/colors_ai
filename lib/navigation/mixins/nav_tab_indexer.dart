import '../blocs/navigation_bloc.dart';

mixin NavTabIndexer {
  int get colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;
  int get shareTabIndex => const NavigationShareTabInitial().tabIndex;
}
