import 'package:clock/clock.dart';

// ignore: prefer-static-class, will be removed in the future.
bool serverMaintenanceNow([DateTime? time]) {
  final DateTime utc = (time ?? clock.now()).toUtc();

  return (utc.hour == 6 && utc.minute > 55) || (utc.hour == 7 && utc.minute < 5);
}
