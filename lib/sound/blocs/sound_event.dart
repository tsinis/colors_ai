import '../../core/constants.dart';

part 'sound_event.freezed.dart';

@freezedWithoutJson
class SoundEvent with _$SoundEvent {
  const factory SoundEvent.locked() = _SoundLocked;
  const factory SoundEvent.started() = _SoundStarted;
  const factory SoundEvent.copied() = _SoundCopied;
  const factory SoundEvent.refreshed() = _SoundRefreshed;
  const factory SoundEvent.favoritesAdded() = _SoundFavoritesAdded;
}
