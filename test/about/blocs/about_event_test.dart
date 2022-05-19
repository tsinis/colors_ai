import 'package:colors_ai/about/blocs/about_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class AboutEventTest extends AboutEvent {
  const AboutEventTest();
}

void main() {
  test('$AboutEvent props', () {
    const AboutEvent aboutEvent = AboutEventTest();
    expect(aboutEvent.props.isEmpty, true);
  });

  test('$AboutStarted props', () {
    const AboutEvent aboutEvent = AboutStarted(currentLocale: '');
    expect(aboutEvent.props, const <String>['']);
  });
}
