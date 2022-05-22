import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:colors_ai/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group(
      'ContextExtensions',
      () {
        testWidgets(
          'l10n',
          (WidgetTester tester) async {
            late final AppLocalizations l10n;

            await tester.pumpWidget(
              MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                builder: (BuildContext context, Widget? _) {
                  l10n = context.l10n;

                  return const SizedBox.shrink();
                },
              ),
            );

            expect(l10n.localeName, kDefaultLanguageCode);
          },
        );

        testWidgets(
          'materialL10n',
          (WidgetTester tester) async {
            late final MaterialLocalizations materialL10n;

            await tester.pumpWidget(
              MaterialApp(
                builder: (BuildContext context, Widget? _) {
                  materialL10n = context.materialL10n;

                  return const SizedBox.shrink();
                },
              ),
            );

            expect(materialL10n.okButtonLabel, 'OK');
          },
        );

        testWidgets(
          'media',
          (WidgetTester tester) async {
            late final MediaQueryData media;

            await tester.pumpWidget(
              MaterialApp(
                builder: (BuildContext context, Widget? _) {
                  media = context.media;

                  return const SizedBox.shrink();
                },
              ),
            );

            expect(media.size.height > 0, isTrue);
          },
        );

        testWidgets(
          'theme',
          (WidgetTester tester) async {
            late final ThemeData theme;

            await tester.pumpWidget(
              MaterialApp(
                builder: (BuildContext context, Widget? _) {
                  theme = context.theme;

                  return const SizedBox.shrink();
                },
              ),
            );

            expect(theme.textTheme.bodyText1?.fontFamily, 'Roboto');
          },
        );
      },
    );