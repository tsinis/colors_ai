// ignore_for_file: avoid_relative_lib_imports

import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/main.dart';
import '../../lib/share/services/url_providers/colors_url_provider.dart';
import '../../lib/testing/test_keys.dart';
import '../helpers/extensions/key_extensions.dart';
import '../helpers/extensions/tester_extensions.dart';

void shareTabTest() {
  const ClipBoard clipboard = ClipBoard();

  testWidgets('Share tab should show ${const ArtsGoogle().name} as default provider', (WidgetTester tester) async {
    await Clipboard.setData(const ClipboardData(text: ''));
    await main();

    final Finder shareTabIcon = await tester.pumpUntilFound(TestKeys.shareTabButton.finder);
    expect(shareTabIcon, findsOneWidget);

    await tester.tapAndSettle(shareTabIcon);

    final Finder defaultProvider = await tester.pumpUntilFound(find.text(const ArtsGoogle().name));
    expect(defaultProvider, findsOneWidget);

    final Finder copyUrlButton = find.byKey(TestKeys.copyUrlButton);
    expect(copyUrlButton, findsOneWidget);

    String? clipboardData = await clipboard.data;
    expect(clipboardData, isEmpty);
    await tester.tap(copyUrlButton);
    final Finder snackbarAction = await tester.pumpUntilFound(find.byType(SnackBarAction));
    expect(snackbarAction, findsWidgets);
    clipboardData = await clipboard.data;
    expect(clipboardData?.startsWith(const ArtsGoogle().fullUrl), isTrue);

    await tester.tapAndSettle(defaultProvider);
    final Finder coolors = await tester.pumpUntilFound(find.textContaining(const Coolors().name));

    await tester.tapAndSettle(coolors.last);
    await tester.tap(copyUrlButton);
    expect(snackbarAction, findsWidgets);
    clipboardData = await clipboard.data;
    expect(clipboardData?.startsWith(const Coolors().fullUrl), isTrue);
  });
}
