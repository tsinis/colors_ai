import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<NavigationState> _stateList;

  NavigationBloc({
    List<NavigationState> stateList = const <NavigationState>[
      NavigationShareTabInitial(),
      NavigationGenerateTabInitial(),
      NavigationFavoritesTabInitial(),
    ],
  })  : _stateList = stateList,
        super(const NavigationGenerateTabInitial());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationGeneratorTabStarted) {
      yield const NavigationGenerateTabInitial();
    } else if (event is NavigationTabChanged) {
      try {
        yield _stateList[event.newTabIndex];
        // ignore: avoid_catching_errors
      } on RangeError catch (_) {
        yield const NavigationFailure();
        yield const NavigationGenerateTabInitial();
      }
    }
  }
}
