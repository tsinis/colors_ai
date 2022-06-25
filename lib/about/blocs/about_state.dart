import '../../core/constants.dart';

part 'about_state.freezed.dart';

@freezedWithoutJson
class AboutState with _$AboutState {
  const factory AboutState.failure() = _AboutFailure;
  const factory AboutState.initial() = _AboutInitial;
  const factory AboutState.loaded({required String appVersion}) = _AboutLoaded;
  const factory AboutState.started({required String currentLocale}) = _AboutStarted;
}
