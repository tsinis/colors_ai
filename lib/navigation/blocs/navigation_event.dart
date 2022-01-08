part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigationGeneratorTabStarted extends NavigationEvent {
  @override
  List<int> get props => <int>[const NavigationGenerateTabInitial().tabIndex];

  const NavigationGeneratorTabStarted();
}

class NavigationTabChanged extends NavigationEvent {
  final int newTabIndex;

  @override
  List<int> get props => <int>[newTabIndex];

  const NavigationTabChanged(this.newTabIndex);
}
