part of 'tab_navigation.bloc.dart';

abstract class TabNavigationState extends Equatable {
  const TabNavigationState();
}

class HomeState extends TabNavigationState {
  final int index = 0;
  static const String title = 'COLOR';

  @override
  List<Object> get props => [index, title];
}

class SavedListState extends TabNavigationState {
  final int index = 1;
  static const String title = 'SAVED';

  @override
  List<Object> get props => [index, title];
}
