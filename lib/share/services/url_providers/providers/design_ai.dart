part of '../colors_url_provider.dart';

/// Example: https://designs.ai/colors/color-wheel?colors=%237dd87d,%234c9173,%235b446a,%23906387.
class DesignAI extends ColorsUrlProvider {
  const DesignAI({
    super.baseUrl = 'designs.ai/colors/color-wheel?colors=%23',
    super.separateSymbol = ',%23',
    super.providerName = 'Design AI',
  });
}
