import 'dart:async';

/// ignore_for_file: avoid-throw-in-catch-block, to match original bloc_test implementation.

import 'package:bloc/bloc.dart';
import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:meta/meta.dart';
import 'package:stream_bloc/stream_bloc.dart';
import 'package:test/test.dart' as test;

@isTest
void streamBlocTest<B extends StreamBloc<Object?, State>, State>(
  String description, {
  required B Function() build,
  FutureOr<void> Function()? setUp,
  State Function()? seed,
  FutureOr<void> Function(B bloc)? act,
  Duration? wait,
  int skip = 0,
  FutureOr<void> Function()? expect,
  void Function(B bloc)? verify,
  FutureOr<void> Function()? errors,
  FutureOr<void> Function()? tearDown,
}) =>
    test.test(
      description,
      () async => testStreamBloc<B, State>(
        setUp: setUp,
        build: build,
        seed: seed,
        act: act,
        wait: wait,
        skip: skip,
        expect: expect,
        verify: verify,
        errors: errors,
        tearDown: tearDown,
      ),
    );

@visibleForTesting
Future<void> testStreamBloc<B extends StreamBloc<Object?, State>, State>({
  required B Function() build,
  FutureOr<void> Function()? setUp,
  State Function()? seed,
  FutureOr<void> Function(B bloc)? act,
  Duration? wait,
  int skip = 0,
  FutureOr<void> Function()? expect,
  FutureOr<void> Function(B bloc)? verify,
  FutureOr<void> Function()? errors,
  FutureOr<void> Function()? tearDown,
}) async {
  bool shallowEquality = false;
  final List<Object> unhandledErrors = <Object>[];
  // ignore: deprecated_member_use, to match original bloc_test implementation.
  final BlocObserver localBlocObserver = BlocOverrides.current?.blocObserver ?? Bloc.observer;
  final _TestStreamBloc testObserver = _TestStreamBloc(localBlocObserver, unhandledErrors.add);
  Bloc.observer = testObserver;

  await runZonedGuarded(
    () async {
      await setUp?.call();
      final List<State> states = <State>[];
      final B bloc = build();

      if (seed != null) {
        bloc.emit(seed());
      }
      final StreamSubscription<State> subscription = bloc.stream.skip(skip).listen(states.add);
      try {
        await act?.call(bloc);
      } catch (error) {
        if (errors == null) {
          rethrow;
        }
        unhandledErrors.add(error);
      }
      if (wait != null) {
        await Future<void>.delayed(wait);
      }

      await Future<void>.delayed(Duration.zero);
      await bloc.close();
      if (expect != null) {
        // ignore: avoid-dynamic, to match original bloc_test implementation.
        final dynamic expected = expect();
        shallowEquality = '$states' == '$expected';
        try {
          test.expect(states, test.wrapMatcher(expected));
        } on test.TestFailure catch (e) {
          if (shallowEquality || expected is! List<State>) {
            rethrow;
          }
          final String diff = _diff(expected: expected, actual: states);
          final String message = '${e.message}\n$diff';

          throw test.TestFailure(message);
        }
      }
      await subscription.cancel();
      await verify?.call(bloc);
      await tearDown?.call();
    },
    (Object error, _) {
      if (shallowEquality && error is test.TestFailure) {
        throw test.TestFailure(
          // ignore: leading_newlines_in_multiline_strings, to match original bloc_test implementation.
          '''${error.message}
WARNING: Please ensure state instances extend Equatable, override == and hashCode, or implement Comparable.
Alternatively, consider using Matchers in the expect of the streamBlocTest rather than concrete state instances.\n''',
        );
      }
      if (errors == null || !unhandledErrors.contains(error)) {
        // ignore: only_throw_errors, to match original bloc_test implementation.
        throw error;
      }
    },
  );
  if (errors != null) {
    test.expect(unhandledErrors, test.wrapMatcher(errors()));
  }
}

class _TestStreamBloc extends BlocObserver {
  final BlocObserver _localObserver;
  final void Function(Object error) _onError;

  _TestStreamBloc(this._localObserver, this._onError);

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    _localObserver.onError(bloc, error, stackTrace);
    _onError(error);
    super.onError(bloc, error, stackTrace);
  }
}

// ignore: unnecessary-nullable, to match original bloc test implementation.
String _diff({required Object? expected, required Object? actual}) {
  final StringBuffer buffer = StringBuffer();
  final List<Diff> differences = diff(expected.toString(), actual.toString());
  buffer
    ..writeln('${"=" * 4} diff ${"=" * 40}')
    ..writeln()
    ..writeln(differences.toPrettyString())
    ..writeln()
    ..writeln('${"=" * 4} end diff ${"=" * 36}');

  return buffer.toString();
}

extension on List<Diff> {
  String toPrettyString() {
    String identical(String str) => '\u001b[90m$str\u001B[0m';
    String deletion(String str) => '\u001b[31m[-$str-]\u001B[0m';
    String insertion(String str) => '\u001b[32m{+$str+}\u001B[0m';

    final StringBuffer buffer = StringBuffer();
    for (final Diff difference in this) {
      switch (difference.operation) {
        case DIFF_EQUAL:
          buffer.write(identical(difference.text));
          break;
        case DIFF_DELETE:
          buffer.write(deletion(difference.text));
          break;
        case DIFF_INSERT:
          buffer.write(insertion(difference.text));
          break;
      }
    }

    return buffer.toString();
  }
}
