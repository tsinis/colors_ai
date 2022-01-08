import 'package:colors_ai/sound/models/sounds_source.dart';
import 'package:colors_ai/sound/repository/sounds_repository.dart';
import 'package:colors_ai/sound/services/sounds_player.dart';

import '../data/mocks/generated.mocks.dart';

const String fileFormat = '.file_format';
const String lockSoundFileName = 'playLock';
const String notificationSimpleFileName = 'playFavoritesAdded';
const String notificationHighFileName = 'playCopy';
const String pathToAssetsDir = 'path_to_assets';
const String refreshSoundFileName = 'playRefresh';

const SoundsSource soundsSource = SoundsSource(
  format: fileFormat,
  path: pathToAssetsDir,
  lock: lockSoundFileName,
  refresh: refreshSoundFileName,
  notificationSimple: notificationSimpleFileName,
  notificationHigh: notificationHighFileName,
);

final SoundsPlayer mockedPlayer = MockSoundsPlayer();

final SoundsRepository soundsRepository = SoundsRepository(sounds: soundsSource, player: mockedPlayer);

String asset(String fileName) => pathToAssetsDir + fileName + fileFormat;
