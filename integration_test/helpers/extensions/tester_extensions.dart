import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

@visibleForTesting
extension TesterExtensions on WidgetTester {
  /// Helper method which tries to replace the earlier, and now missing
  /// FlutterDriver.waitFor method. Requires [Finder] according to
  /// which it tries to redraw the screen, triggers a frame after [pumpDuration]
  /// amount of time and search for the requested object
  /// in widget tree until the timer expires.
  ///```dart
  /// final foundButton = await tester.pumpUntilFound(
  ///   find.byKey(LoginPageKey.loginButton),
  /// );
  /// expect(foundButton, findsOneWidget);
  /// ```
  /// [finder] is mandatory, it's an object to find which
  /// is also returned after timeout.
  /// [timeoutInSeconds] is optional, sets maximum amount of seconds
  /// to wait for the object to appear.
  /// If finder does not find the expected element: throws an [TimeoutException]
  /// after [timeoutInSeconds] ends. Default to 'false'.
  Future<Finder> pumpUntilFound(
    Finder finder, {
    Duration? pumpDuration = const Duration(milliseconds: 10),
    bool throwExceptionWhenNotFound = false,
    int timeoutInSeconds = 5,
  }) async {
    bool timerDone = false;
    final Timer timer = Timer(
      Duration(seconds: timeoutInSeconds),
      () {
        debugPrint("Timer is done! Didn't find the $finder");
        if (throwExceptionWhenNotFound) {
          throw TimeoutException('Pump until has timed out after $timeoutInSeconds sec.');
        }
        timerDone = true;
      },
    );
    while (!timerDone) {
      await pump(pumpDuration);
      try {
        if (any(finder)) {
          timerDone = true;
        }
      } catch (_) {}
    }
    timer.cancel();

    return finder;
  }

  /// Taps on [finder] and waits for animation to complete.
  Future<void> tapAndSettle(
    Finder finder, {
    bool warnIfMissed = true,
    Duration duration = const Duration(milliseconds: 100),
  }) async {
    await tap(finder, warnIfMissed: warnIfMissed);
    await pumpAndSettle(duration);
  }
}
