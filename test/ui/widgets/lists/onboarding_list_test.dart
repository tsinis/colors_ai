import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../../lib/blocs/onboarding/onboarding_bloc.dart';
import '../../../../lib/flutter_colors_ai_keys.dart';
import '../../../../lib/models/colors/constants.dart';
import '../../../../lib/ui/widgets/lists/onboarding_list.dart';

void main() => testWidgets('Onboarding should dissapear after tap on "GOT IT" button', (tester) async {
      await Hive.initFlutter();

      final button = find.byKey(FlutterColorsAIKeys.onboardingFinish);
      final dissapear = find.byKey(FlutterColorsAIKeys.disappearedOnboard);
      final TestViewConfiguration defaultConfig = TestViewConfiguration();

      await tester.pumpWidget(
        BlocProvider(
          create: (_) => OnboardingBloc(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FittedBox(
              child: OnboardingList(
                tileWidth: defaultConfig.size.width,
                tileHeight: defaultConfig.size.height / defaultColors.length,
              ),
            ),
          ),
        ),
      );

      expect(button, findsOneWidget);
      expect(dissapear, findsNothing);

      await tester.tap(button);
      await tester.pump();

      expect(button, findsNothing);
      expect(dissapear, findsOneWidget);
    });
