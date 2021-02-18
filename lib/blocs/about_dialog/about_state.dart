part of 'about_bloc.dart';

abstract class AboutState extends Equatable {
  const AboutState();
  @override
  List<Object> get props => [];
}

class AboutCloseInitial extends AboutState {
  const AboutCloseInitial();
}

class AboutOpenInitial extends AboutState {
  const AboutOpenInitial({required this.appVersion, required this.appName});

  final String appVersion, appName;
}

class AboutFailure extends AboutState {
  const AboutFailure();
}
