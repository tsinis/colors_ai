part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const AboutEvent();
}

class AboutStarted extends AboutEvent {
  final String currentLocale;

  @override
  List<Object> get props => <String>[currentLocale];

  const AboutStarted({required this.currentLocale});
}

class AboutColormindApiTaped extends AboutEvent {
  const AboutColormindApiTaped();
}

class AboutHuemintApiTaped extends AboutEvent {
  const AboutHuemintApiTaped();
}

class AboutSourceCodeTaped extends AboutEvent {
  const AboutSourceCodeTaped();
}

class AboutSoundAssetsTaped extends AboutEvent {
  const AboutSoundAssetsTaped();
}

class AboutGoogleTaped extends AboutEvent {
  const AboutGoogleTaped();
}

class AboutLicenseTaped extends AboutEvent {
  const AboutLicenseTaped();
}
