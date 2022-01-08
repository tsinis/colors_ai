part of 'about_bloc.dart';

abstract class AboutEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const AboutEvent();
}

class AboutStarted extends AboutEvent {
  final String currentLocale;

  @override
  List<String> get props => <String>[currentLocale];

  const AboutStarted({required this.currentLocale});
}

class AboutColormindTaped extends AboutEvent {
  const AboutColormindTaped();
}

class AboutHuemintTaped extends AboutEvent {
  const AboutHuemintTaped();
}

class AboutSourceCodeTaped extends AboutEvent {
  const AboutSourceCodeTaped();
}

class AboutSoundsTaped extends AboutEvent {
  const AboutSoundsTaped();
}

class AboutGoogleTaped extends AboutEvent {
  const AboutGoogleTaped();
}

class AboutLicensesTaped extends AboutEvent {
  const AboutLicensesTaped();
}
