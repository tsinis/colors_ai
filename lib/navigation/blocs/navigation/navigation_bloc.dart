import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({
    this.stateList = const <NavigationState>[
      NavigationShareTabInitial(),
      NavigationGenerateTabInitial(),
      NavigationFavoritesTabInitial(),
    ],
  }) : super(const NavigationGenerateTabInitial());

  final List<NavigationState> stateList;

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationGeneratorTabStarted) {
      try {
        yield const NavigationGenerateTabInitial();
      } on Exception catch (_) {
        yield const NavigationFailure();
      }
    } else if (event is NavigationTabChanged) {
      try {
        yield stateList[event.newTabIndex];
      } on Exception catch (_) {
        yield const NavigationFailure();
      }
    }
  }
}
