import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';
import '../../general/services/data_storage.dart';

mixin DeviceCapabilities {
  late final bool canSharePdf, canSharePng;

  late final String storagePath;

  Future<void> init() async {
    storagePath = kIsWeb ? '' : (await DataStorage.directory).path;
    final PrintingInfo info = await Printing.info();
    canSharePdf = info.canShare;
    canSharePng = info.canRaster;
  }
}
