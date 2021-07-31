part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

class AboutStarted extends AboutEvent {
  const AboutStarted({required this.currentLocale});
  final String currentLocale;
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
