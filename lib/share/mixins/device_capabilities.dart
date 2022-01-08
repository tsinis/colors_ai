import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';

import '../../core/services/data_storage.dart';

mixin DeviceCapabilities {
  late final bool canSharePdf;
  late final bool canSharePng;

  late final String storagePath;

  Future<void> init() async {
    try {
      storagePath = kIsWeb ? '' : await const DataStorage().path;
      final PrintingInfo info = await Printing.info();
      canSharePdf = info.canShare;
      canSharePng = info.canRaster;
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      canSharePng = canSharePdf = false;
    }
  }
}
