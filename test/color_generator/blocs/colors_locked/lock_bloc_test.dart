import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/color_generator/blocs/colors_locked/lock_bloc.dart';
import 'package:colors_ai/color_generator/models/locks/locked_colors.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/core/repository/colors_repository.dart';
import 'package:colors_ai/settings/dao/generator_dao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$LockBloc', () {
      late LockedColors lockedColors;
      late ColorsRepository colorsRepository;

      setUp(() {
        lockedColors = LockedColors(list: List<bool>.of(<bool>[true, false]));
        colorsRepository = ColorsRepository(
          colorPalette: ColorPalette(colors: List<Color>.of(<Color>[])),
          lockedColors: lockedColors,
          getNewColors: GeneratorDAO().fetchNewColors,
        );
      });

      blocTest<LockBloc, void>(
        'on Initial',
        build: () => LockBloc(colorsRepository),
        expect: () => isEmpty,
      );

      blocTest<LockBloc, LockState>(
        '$LockStarted',
        build: () => LockBloc(colorsRepository),
        act: (LockBloc bloc) => bloc.add(const LockStarted()),
        expect: () => <TypeMatcher<LockState>>[isA<LockSuccess>()],
        verify: (LockBloc bloc) {
          final LockState state = bloc.state;
          expect(state is LockSuccess, isTrue);
          expect((state as LockSuccess).isLocked(0), isTrue);
          expect(state.isLocked(1), isFalse);
          expect(state.isLocked(2), isFalse);
          expect(lockedColors.list, <bool>[true, false]);
        },
      );

      blocTest<LockBloc, LockState>(
        '$LockChanged onlyLock false',
        build: () => LockBloc(colorsRepository),
        act: (LockBloc bloc) => bloc.add(const LockChanged(0)),
        expect: () => <TypeMatcher<LockState>>[isA<LockSuccess>()],
        verify: (LockBloc bloc) => expect(lockedColors.list, <bool>[false, false]),
      );

      blocTest<LockBloc, LockState>(
        '$LockChanged onlyLock true',
        build: () => LockBloc(colorsRepository),
        act: (LockBloc bloc) => bloc.add(const LockChanged(0, onlyLock: true)),
        expect: () => <TypeMatcher<LockState>>[isA<LockSuccess>()],
        verify: (LockBloc bloc) => expect(lockedColors.list, <bool>[true, false]),
      );

      blocTest<LockBloc, LockState>(
        '$LockAllUnlocked',
        build: () => LockBloc(colorsRepository),
        act: (LockBloc bloc) => bloc.add(const LockAllUnlocked()),
        expect: () => <TypeMatcher<LockState>>[isA<LockSuccess>()],
        verify: (LockBloc bloc) => expect(lockedColors.list, <bool>[false, false]),
      );
    });
