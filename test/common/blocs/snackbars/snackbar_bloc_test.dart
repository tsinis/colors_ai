import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/common/blocs/snackbars/snackbar_bloc.dart';
import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../data/fakes/fake_clipboard.dart';
import '../../data.dart';

void main() {
  const List<SnackbarEvent> events = <SnackbarEvent>[
    FileCopiedSuccess('format'),
    ColorCopiedSuccess(),
    UrlCopiedSuccess(),
  ];

  void testCopyEvent(SnackbarEvent event, {bool withException = false}) {
    final ClipBoard clipboard = FakeClipboard(throwExceptionOnCopy: withException);
    blocTest<SnackbarBloc, SnackbarState>(
      '${event.runtimeType}${withException ? ' with invalid clipboard data' : ''}',
      build: () => SnackbarBloc(clipboard: clipboard),
      act: (SnackbarBloc bloc) => bloc.add(event),
      skip: withException ? 0 : 1,
      expect: () => <TypeMatcher<SnackbarState>>[
        if (withException) isA<ClipboardCopyFailure>(),
        ...<TypeMatcher<SnackbarState>>[isA<SnackbarsInitial>()],
      ],
    );
  }

  group('$SnackbarBloc', () {
    blocTest<SnackbarBloc, SnackbarState>('on Initial', build: SnackbarBloc.new, expect: () => isEmpty);

    blocTest<SnackbarBloc, SnackbarState>(
      '$ShareFail',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(const ShareFail()),
      expect: () => <TypeMatcher<SnackbarState>>[isA<ShareAttemptFailure>(), isA<SnackbarsInitial>()],
    );

    events
      ..forEach(testCopyEvent)
      ..forEach((SnackbarEvent event) => testCopyEvent(event, withException: true));

    blocTest<SnackbarBloc, SnackbarState>(
      '$ServerStatusCheckedSuccess during maintenance time',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(ServerStatusCheckedSuccess(maintenanceTime)),
      expect: () => <TypeMatcher<SnackbarState>>[isA<ServerStatusCheckSuccess>(), isA<SnackbarsInitial>()],
    );

    blocTest<SnackbarBloc, SnackbarState>(
      'no $ServerStatusCheckedSuccess after maintenance time',
      build: SnackbarBloc.new,
      act: (SnackbarBloc bloc) => bloc.add(ServerStatusCheckedSuccess(noMaintenanceTime)),
      expect: () => <TypeMatcher<SnackbarState>>[isA<SnackbarsInitial>()],
    );

    blocTest<SnackbarBloc, SnackbarState>(
      '$UrlOpenedSuccess with invalid data',
      build: () => SnackbarBloc(clipboard: FakeClipboard(), urlLauncher: mockedUrlLauncher),
      act: (SnackbarBloc bloc) {
        when<Future<bool>>(mockedUrlLauncher.openURL(any)).thenAnswer((_) async => true);
        bloc.add(const UrlOpenedSuccess());
      },
      expect: () => <TypeMatcher<SnackbarState>>[isA<SnackbarsInitial>()],
      verify: (_) => verifyZeroInteractions(mockedUrlLauncher),
    );

    final ClipBoard clipboard = FakeClipboard();

    blocTest<SnackbarBloc, SnackbarState>(
      '$UrlOpenedSuccess with valid data',
      build: () => SnackbarBloc(clipboard: clipboard, urlLauncher: mockedUrlLauncher),
      act: (SnackbarBloc bloc) async {
        await clipboard.copyTextData('url');
        when<Future<bool>>(mockedUrlLauncher.openURL(any)).thenAnswer((_) async => true);
        bloc.add(const UrlOpenedSuccess());
      },
      expect: () => <TypeMatcher<SnackbarState>>[isA<SnackbarsInitial>()],
      verify: (_) => verify(mockedUrlLauncher.openURL('url')).called(1),
    );
  });
}
