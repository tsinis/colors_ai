part of '../colors_url_provider.dart';

class DesignAI extends ColorsUrlProvider {
  const DesignAI()
      : super(baseUrl: 'designs.ai/colors/color-wheel?colors=%23', separateSymbol: ',%23', providerName: 'Design AI');
  // Example: https://designs.ai/colors/color-wheel?colors=%237dd87d,%234c9173,%235b446a,%23906387.
}
