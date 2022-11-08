import 'dart:async';

import 'package:bloc/bloc.dart';

import 'navigation_event.dart';

export 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<NavigationState> _stateList;

  NavigationBloc({
    List<NavigationState> stateList = NavigationState.values,
  })  : _stateList = stateList,
        super(NavigationState.generate);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) => event.when(
        started: () async* {
          yield NavigationState.generate;
        },
        changed: (int newTabIndex) async* {
          try {
            yield _stateList.elementAt(newTabIndex);
            // TODO: Use [elementAtOrNull] from [collection] package after Flutter version bump.
            // ignore: avoid_catching_errors, since it what elementAt method throws.
          } on RangeError catch (_) {
            yield NavigationState.generate;
          }
        },
      );
}
