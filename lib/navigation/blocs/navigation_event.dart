import '../../core/constants.dart';

part 'navigation_event.freezed.dart';

@freezedWithoutJson
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.started() = _NavigationGeneratorTabStarted;
  const factory NavigationEvent.changed(int newTabIndex) = _NavigationTabChanged;
}
