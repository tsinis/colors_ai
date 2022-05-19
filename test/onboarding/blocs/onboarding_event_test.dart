import 'package:colors_ai/navigation/blocs/navigation_bloc.dart';
import 'package:colors_ai/onboarding/blocs/onboarding_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class OnboardingEventTest extends OnboardingEvent {
  const OnboardingEventTest();
}

void main() => group('$OnboardingEvent', () {
      test('abstract props', () {
        const OnboardingEvent aboutEvent = OnboardingEventTest();
        expect(aboutEvent.props.isEmpty, true);
      });

      test('$NavigationGeneratorTabStarted props', () {
        const NavigationGeneratorTabStarted aboutEvent = NavigationGeneratorTabStarted();
        expect(aboutEvent.props, <int>[const NavigationGenerateTabInitial().tabIndex]);
      });

      test('$NavigationTabChanged props', () {
        const NavigationTabChanged aboutEvent = NavigationTabChanged(0);
        expect(aboutEvent.props, <int>[0]);
      });
    });
