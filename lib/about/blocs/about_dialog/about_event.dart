part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

class AboutClosed extends AboutEvent {
  const AboutClosed();
}

class AboutStarted extends AboutEvent {
  const AboutStarted({required this.currentLocale});
  final String currentLocale;
}

class AboutOpened extends AboutEvent {
  const AboutOpened();
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
