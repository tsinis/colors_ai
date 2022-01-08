import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/navigation/blocs/navigation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$NavigationBloc', () {
      blocTest<NavigationBloc, NavigationState>('on Initial', build: NavigationBloc.new, expect: () => isEmpty);

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationGeneratorTabStarted',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(const NavigationGeneratorTabStarted()),
        expect: () => <TypeMatcher<NavigationState>>[isA<NavigationGenerateTabInitial>()],
      );

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationTabChanged',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(NavigationTabChanged(const NavigationShareTabInitial().tabIndex)),
        expect: () => <TypeMatcher<NavigationState>>[isA<NavigationShareTabInitial>()],
      );

      blocTest<NavigationBloc, NavigationState>(
        '$NavigationTabChanged with $RangeError',
        build: NavigationBloc.new,
        act: (NavigationBloc bloc) => bloc.add(const NavigationTabChanged(-1)),
        expect: () => <TypeMatcher<NavigationState>>[isA<NavigationFailure>(), isA<NavigationGenerateTabInitial>()],
      );
    });
