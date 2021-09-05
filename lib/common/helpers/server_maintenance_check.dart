import 'package:clock/clock.dart';

bool get serverMaintenanceNow {
  final DateTime utc = clock.now().toUtc();
  return (utc.hour == 6 && utc.minute > 55) || (utc.hour == 7 && utc.minute < 5);
}
