import 'package:colors_ai/resources/sounds.dart';
import 'package:colors_ai/sound/models/sound.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$Sound', () {
      String removeAssetsDir(String fullPath) => fullPath.replaceFirst('assets/', '');
      test('asset', () {
        expect(Sound.values, isNotEmpty);
        expect(Sound.lock.asset, removeAssetsDir(Sounds.uiLock));
        expect(Sound.notificationSimple.asset, removeAssetsDir(Sounds.notificationSimple02));
        expect(Sound.notificationHigh.asset, removeAssetsDir(Sounds.notificationHighIntensity));
        expect(Sound.refresh.asset, removeAssetsDir(Sounds.uiRefreshFeed));
      });
    });
