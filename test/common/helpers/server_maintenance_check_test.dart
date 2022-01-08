import 'package:clock/clock.dart';
import 'package:colors_ai/common/helpers/server_maintenance_check.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group('serverMaintenanceNow()', () {
      test(
        'true during maintenance time',
        () => withClock(Clock.fixed(maintenanceTime), () => expect(serverMaintenanceNow(), true)),
      );
      test(
        'false after maintenance time',
        () => withClock(Clock.fixed(noMaintenanceTime), () => expect(serverMaintenanceNow(), false)),
      );
    });
