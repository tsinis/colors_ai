part of '../colors_url_provider.dart';

// Example: https://www.sessions.edu/color-calculator-results/?colors=a14747,47a147,4747a1,a17447,ffffff.
class SessionsCollege extends ColorsUrlProvider {
  const SessionsCollege({
    super.baseUrl = 'www.sessions.edu/color-calculator-results/?colors=',
    super.separateSymbol = ',',
  });
}
