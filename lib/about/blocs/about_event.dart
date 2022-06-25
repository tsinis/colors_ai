import '../../core/constants.dart';

part 'about_event.freezed.dart';

@freezedWithoutJson
class AboutEvent with _$AboutEvent {
  const factory AboutEvent.colormindTaped() = _AboutColormindTaped;
  const factory AboutEvent.googleTaped() = _AboutGoogleTaped;
  const factory AboutEvent.huemintTaped() = _AboutHuemintTaped;
  const factory AboutEvent.licensesTaped() = _AboutLicensesTaped;
  const factory AboutEvent.soundsTaped() = _AboutSoundsTaped;
  const factory AboutEvent.sourceCodeTaped() = _AboutSourceCodeTaped;
  const factory AboutEvent.started({required String currentLocale}) = _AboutStarted;
}
