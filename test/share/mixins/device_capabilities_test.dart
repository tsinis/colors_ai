import 'package:colors_ai/share/mixins/device_capabilities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../data/fakes/fake_path_provider_platform.dart';

class _DeviceCapabilitiesTest with DeviceCapabilities {}

void main() => group('$DeviceCapabilities', () {
      late _DeviceCapabilitiesTest deviceCapabilities;

      setUp(() => deviceCapabilities = _DeviceCapabilitiesTest());

      test('init()', () async {
        final FakePathProviderPlatform fakePlatform = FakePathProviderPlatform();
        PathProviderPlatform.instance = fakePlatform;
        await deviceCapabilities.init();
        expect(deviceCapabilities.canSharePdf, false);
        expect(deviceCapabilities.canSharePng, false);
        expect(deviceCapabilities.storagePath.startsWith(fakePlatform.applicationDocumentsPath), true);
      });

      test('init() with $Exception', () async {
        final FakePathProviderPlatform fakePlatform = FakePathProviderPlatform();
        PathProviderPlatform.instance = fakePlatform;
        final Future<void> init = deviceCapabilities.init();
        await expectLater(init, isA<Future<void>>());
        expect(deviceCapabilities.canSharePdf, false);
        expect(deviceCapabilities.canSharePng, false);
      });
    });
