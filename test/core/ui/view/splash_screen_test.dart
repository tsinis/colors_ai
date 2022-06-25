import 'package:colors_ai/app/theme/constants.dart';
import 'package:colors_ai/core/ui/view/splash_screen.dart';
import 'package:colors_ai/onboarding/blocs/onboarding_bloc.dart';
import 'package:colors_ai/onboarding/repository/onboarding_repository.dart';
import 'package:colors_ai/onboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/fakes/fake_hive_box.dart';

void main() => testWidgets('$SplashScreen should be visible until onboarding data loads', (WidgetTester tester) async {
      const Duration duration = kDefaultLongTransitionDuration;
      final FakeHiveBox<bool> fakeBox = FakeHiveBox<bool>.empty();

      await tester.pumpWidget(
        BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(OnboardingRepository(OnboardingHiveStorage(openedBox: fakeBox)))
            ..add(const OnboardingEvent.started()),
          child: MaterialApp(
            home: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, OnboardingState state) => Stack(
                children: <Widget>[
                  const SplashScreen(),
                  AnimatedOpacity(
                    duration: duration,
                    opacity: state.maybeWhen(
                      initial: () => 0,
                      loading: () => 0,
                      orElse: () => 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is AnimatedOpacity && widget.opacity == 0,
          description: '$Widget above $SplashScreen should be completely invisible',
        ),
        findsOneWidget,
      );

      await tester.pump(duration);

      expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is AnimatedOpacity && widget.opacity == 1,
          description: '$Widget above $SplashScreen should be completely visible',
        ),
        findsOneWidget,
      );
    });
