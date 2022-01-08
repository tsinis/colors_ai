import 'package:colors_ai/sound/models/sound.dart';
import 'package:colors_ai/sound/models/sounds_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$SoundsSource',
      () => test(
        'asset()',
        () => expect(soundsSource.asset(Sound.lock), pathToAssetsDir + lockSoundFileName + fileFormat),
      ),
    );
