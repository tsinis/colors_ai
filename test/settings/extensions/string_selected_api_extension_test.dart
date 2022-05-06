import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:colors_ai/settings/extensions/string_selected_api_extension.dart';
import 'package:colors_ai/settings/models/selected_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => testWidgets('StringSelectedApiExtension helperText()', (WidgetTester tester) async {
      const Key colormindKey = ValueKey<bool>(true);
      const Key huemintKey = ValueKey<bool>(false);
      const SelectedAPI colormind = SelectedAPI.colormind;
      const SelectedAPI huemint = SelectedAPI.huemint;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Builder(
            builder: (BuildContext context) => Column(
              children: <Text>[
                Text(colormind.helperText(context.l10n), key: colormindKey),
                Text(huemint.helperText(context.l10n), key: huemintKey),
              ],
            ),
          ),
        ),
      );

      final Finder colormindFinder = find.byKey(colormindKey);
      expect(colormindFinder, findsOneWidget);
      colormindFinder.precache();

      final Finder huemintFinder = find.byKey(huemintKey);
      expect(huemintFinder, findsOneWidget);
      huemintFinder.precache();

      final Widget colormindWidget = colormindFinder.evaluate().first.widget;
      expect(colormindWidget, isA<Text>());

      final Widget huemintWidget = huemintFinder.evaluate().first.widget;
      expect(huemintWidget, isA<Text>());

      final String? colormindText = (colormindWidget as Text).data;
      expect(colormindText, isNotNull);
      expect(colormindText!.contains(','), true);

      final String? huemintText = (huemintWidget as Text).data;
      expect(huemintText, isNotNull);
      expect(huemintText!.contains(','), true);

      expect(huemintText != colormindText, true);
    });
