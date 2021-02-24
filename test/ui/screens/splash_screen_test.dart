import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../lib/blocs/onboarding/onboarding_bloc.dart';
import '../../../lib/ui/screens/splash_screen.dart';

void main() => testWidgets('Splash should dissapear after onboard data load', (tester) async {
      await Hive.initFlutter();
      final splash = find.byKey(const ValueKey<bool>(true));
      const Duration animationDuration = Duration(seconds: 2);
      late bool loadingOnboardData;

      await tester.pumpWidget(
        BlocProvider(
          create: (_) => OnboardingBloc(),
          child: MaterialApp(
            home: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, state) {
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
