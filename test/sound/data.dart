import 'package:colors_ai/sound/repository/sounds_repository.dart';
import 'package:colors_ai/sound/services/sounds_player.dart';

import '../data/mocks/generated.mocks.dart';

final SoundsPlayer mockedPlayer = MockSoundsPlayer();

final SoundsRepository soundsRepository = SoundsRepository(player: mockedPlayer);
