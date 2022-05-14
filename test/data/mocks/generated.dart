import 'package:colors_ai/core/services/url_launcher.dart';
import 'package:colors_ai/sound/services/sounds_player.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:window_size/src/window_size_channel.dart';

// Annotation which generates the generated.mocks.dart library and the mocked classes.
@GenerateMocks(_mocks)
const List<Type> _mocks = <Type>[
  BinaryReader,
  BinaryWriter,
  FlutterSecureStorage,
  SoundsPlayer,
  UrlLauncher,
  WindowSizeChannel,
];
