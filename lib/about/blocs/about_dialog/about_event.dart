part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  @override
  List<Object> get props => [];

  const AboutEvent();
}

class AboutStarted extends AboutEvent {
  final String currentLocale;

  @override
  List<Object> get props => [currentLocale];

  const AboutStarted({required this.currentLocale});
}

class AboutApiProviderTaped extends AboutEvent {
  const AboutApiProviderTaped();
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
