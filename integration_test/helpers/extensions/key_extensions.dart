import 'package:flutter/foundation.dart' show Key;
import 'package:flutter_test/flutter_test.dart';

extension KeyExtensions on Key {
  Finder get finder => find.byKey(this);
}
