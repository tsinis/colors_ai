import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_navigation.event.dart';
part 'tab_navigation.state.dart';

class TabNavigationBloc extends Bloc<TabNavigationEvent, TabNavigationState> {
  TabNavigationBloc() : super(HomeState());

  @override
  Stream<TabNavigationState> mapEventToState(TabNavigationEvent event) async* {
    if (event is LoadHome) {
      yield HomeState();
    }
    if (event is LoadSaved) {
      yield SavedListState();
    }
  }
}
