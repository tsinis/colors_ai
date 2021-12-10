import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../lib/core/services/data_storage.dart';
import '../../../lib/core/ui/view/splash_screen.dart';
import '../../../lib/oboarding/blocs/onboarding/onboarding_bloc.dart';

void main() => testWidgets('Splash should dissapear after onboard data load', (WidgetTester tester) async {
      await DataStorage.init();
      final Finder splash = find.byKey(const ValueKey<bool>(true));
      const Duration animationDuration = Duration(seconds: 2);
      late bool loadingOnboardData;

      await tester.pumpWidget(
        BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(),
          child: MaterialApp(
            home: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, OnboardingState state) {
                loadingOnboardData = state is OnboardingLoadInProgress;

                return AnimatedOpacity(
                  duration: animationDuration,
                  opacity: loadingOnboardData ? 0.5 : 1,
                  child: loadingOnboardData ? const SplashScreen() : const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      );

      if (loadingOnboardData) {
        expect(splash, findsOneWidget);
      } else {
        expect(splash, findsNothing);
      }

      await tester.pump(animationDuration);

      expect(splash, findsNothing);
    });
