part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationShareTabStarted extends NavigationEvent {
  const NavigationShareTabStarted();
}

class NavigationTabChanged extends NavigationEvent {
  const NavigationTabChanged(this.newTabIndex);

  final int newTabIndex;
}

class NavigationGeneratorTabStarted extends NavigationEvent {
  const NavigationGeneratorTabStarted();
}

class NavigationSaverTabStarted extends NavigationEvent {
  const NavigationSaverTabStarted();
}
