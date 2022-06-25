import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/navigation/blocs/navigation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$NavigationBloc', () {
      blocTest<NavigationBloc, NavigationState>('on Initial', build: NavigationBloc.new, expect: () => isEmpty);

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationEvent.started',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(const NavigationEvent.started()),
        expect: () => <NavigationState>[NavigationState.generate],
      );

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationEvent.changed',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(NavigationEvent.changed(NavigationState.share.index)),
        expect: () => <NavigationState>[NavigationState.share],
      );

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationEvent.changed with $RangeError',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(const NavigationEvent.changed(-1)),
        expect: () => <NavigationState>[NavigationState.generate],
      );
    });
