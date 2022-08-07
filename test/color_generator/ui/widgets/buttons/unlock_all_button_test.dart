import 'package:colors_ai/color_generator/blocs/colors_locked/lock_bloc.dart';
import 'package:colors_ai/color_generator/models/locks/locked_colors.dart';
import 'package:colors_ai/color_generator/ui/widgets/buttons/unlock_all_button.dart';
import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/core/repository/colors_repository.dart';
import 'package:colors_ai/settings/dao/generator_dao.dart';
import 'package:colors_ai/sound/blocs/sound_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../sound/data.dart';

void main() => group('$UnlockAllButton', () {
      final LockedColors lockedColors = LockedColors(list: List<bool>.of(<bool>[true, false]));

      testWidgets('tap', (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<BlocBase<Object?>>>[
              BlocProvider<SoundBloc>(create: (_) => SoundBloc(soundsRepository)),
              BlocProvider<LockBloc>(
                create: (_) => LockBloc(
                  ColorsRepository(
                    colorPalette: ColorPalette(colors: List<Color>.of(<Color>[])),
                    lockedColors: lockedColors,
                    getNewColors: GeneratorDAO().fetchNewColors,
                  ),
                ),
              ),
            ],
            child: const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: Material(child: UnlockAllButton()),
            ),
          ),
        );
        final Finder button = find.byType(UnlockAllButton);
        expect(button, findsOneWidget);

        expect(lockedColors.list, <bool>[true, false]);
        await tester.tap(button);
        expect(lockedColors.list, <bool>[false, false]);
      });
    });
