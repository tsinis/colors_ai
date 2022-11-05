import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/common/blocs/snackbars/snackbar_bloc.dart';
import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../data/fakes/fake_clipboard.dart';
import '../../data.dart';

void main() {
  const List<SnackbarEvent> events = <SnackbarEvent>[
    SnackbarEvent.fileCopied('format'),
    SnackbarEvent.colorCopied(),
    SnackbarEvent.urlCopied(),
  ];

  const String url = 'url';

  void testCopyEvent(SnackbarEvent event, {bool withException = false}) {
    final ClipBoard clipboard = FakeClipboard(throwExceptionOnCopy: withException);
    if (!withException) {
      unawaited(clipboard.copyTextData('data'));
    }
    blocTest<SnackbarBloc, SnackbarState>(
      '${event.runtimeType}${withException ? ' with invalid clipboard data' : ''}',
      build: () => SnackbarBloc(clipboard: clipboard),
      act: (SnackbarBloc bloc) => bloc.add(event),
      skip: withException ? 0 : 1,
      expect: () => <SnackbarState>[
        if (withException) const SnackbarState.copyFailure(),
        ...<SnackbarState>[const SnackbarState.initial()],
      ],
    );
  }

  group('$SnackbarBloc', () {
    blocTest<SnackbarBloc, SnackbarState>('on Initial', build: SnackbarBloc.new, expect: () => isEmpty);

    blocTest<SnackbarBloc, SnackbarState>(
      '$SnackbarEvent.shareFailed',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(const SnackbarEvent.shareFailed()),
      expect: () => <SnackbarState>[const SnackbarState.shareFailure(), const SnackbarState.initial()],
    );

    events
      ..forEach(testCopyEvent)
      ..forEach((SnackbarEvent event) => testCopyEvent(event, withException: true));

    blocTest<SnackbarBloc, SnackbarState>(
      '$SnackbarEvent.serverStatusChecked during maintenance time',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(SnackbarEvent.serverStatusChecked(maintenanceTime)),
      expect: () => <SnackbarState>[const SnackbarState.serverStatusCheck(), const SnackbarState.initial()],
    );

    blocTest<SnackbarBloc, SnackbarState>(
      'no $SnackbarEvent.serverStatusChecked after maintenance time',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(SnackbarEvent.serverStatusChecked(noMaintenanceTime)),
      expect: () => <SnackbarState>[const SnackbarState.initial()],
    );

    blocTest<SnackbarBloc, SnackbarState>(
      '$SnackbarEvent.urlOpened with invalid data',
      build: () => SnackbarBloc(clipboard: FakeClipboard(), urlLauncher: mockedUrlLauncher),
      act: (SnackbarBloc bloc) => bloc.add(const SnackbarEvent.urlOpened(url)),
      expect: () => isEmpty,
      verify: (_) async => verify(mockedUrlLauncher.openURL(url)).called(1),
    );

    final ClipBoard clipboard = FakeClipboard();

    blocTest<SnackbarBloc, SnackbarState>(
      '$SnackbarEvent.urlOpened with valid data',
      build: () => SnackbarBloc(clipboard: clipboard, urlLauncher: mockedUrlLauncher),
      act: (SnackbarBloc bloc) async {
        await clipboard.copyTextData(url);
        when<Future<bool>>(mockedUrlLauncher.openURL(url)).thenAnswer((_) async => true);
        bloc.add(const SnackbarEvent.urlOpened(url));
      },
      expect: () => <SnackbarState>[const SnackbarState.initial()],
      verify: (_) async => verify(mockedUrlLauncher.openURL(url)).called(1),
    );
  });
}
