import 'package:colors_ai/core/services/url_launcher.dart';

import '../data/mocks/generated.mocks.dart';

const String clipboardData = 'clipboard';

final DateTime maintenanceTime = DateTime.utc(2022, 1, 1, 7);
final DateTime noMaintenanceTime = maintenanceTime.add(const Duration(minutes: 5));

final UrlLauncher mockedUrlLauncher = MockUrlLauncher();
