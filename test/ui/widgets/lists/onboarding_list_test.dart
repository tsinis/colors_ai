import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../../lib/color_generator/models/colors/constants.dart';
import '../../../../lib/general/services/data_storage.dart';
import '../../../../lib/oboarding/blocs/onboarding/onboarding_bloc.dart';
import '../../../../lib/oboarding/ui/view/onboarding_overlay.dart';
import '../../../../lib/testing/test_keys.dart';

void main() => testWidgets('Onboarding should dissapear after tap on "GOT IT" button', (tester) async {
      await DataStorage.init();

      final button = find.byKey(TestKeys.onboardingFinish);
      final dissapear = find.byKey(TestKeys.disappearedOnboard);
      final TestViewConfiguration defaultConfig = TestViewConfiguration();

      await tester.pumpWidget(
        BlocProvider(
          create: (_) => OnboardingBloc(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FittedBox(
              child: OnboardingOverlay(
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
