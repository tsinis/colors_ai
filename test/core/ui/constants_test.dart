import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:colors_ai/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => testWidgets(
      'tabNames()',
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

        final List<String> names = tabNames(l10n);

        expect(names.length, 3);
      },
    );
