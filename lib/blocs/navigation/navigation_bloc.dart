import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationGenerateTabInitial());

  static const List<NavigationState> _stateList = <NavigationState>[
    NavigationShareTabInitial(),
    NavigationGenerateTabInitial(),
    NavigationFavoritesTabInitial()
  ];

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
        yield _stateList[event.newTabIndex];
      } on Exception catch (_) {
        yield const NavigationFailure();
      }
      // } else if (event is NavigationSaverTabStarted) {
      //   try {
      //     yield const NavigationFavoritesTabInitial();
      //   } catch (_) {
      //     yield const NavigationFailure();
      //   }
      // } else if (event is NavigationShareTabStarted) {
      //   try {
      //     yield const NavigationShareTabInitial();
      //   } catch (_) {
      //     yield const NavigationFailure();
      //   }
    }
  }
}
