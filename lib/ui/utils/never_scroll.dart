import 'package:flutter/material.dart';

class NeverScroll extends ScrollBehavior {
  const NeverScroll();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const NeverScrollableScrollPhysics();
}
