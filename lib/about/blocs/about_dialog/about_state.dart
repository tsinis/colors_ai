part of 'about_bloc.dart';

abstract class AboutState extends Equatable {
  final String appVersion;

  @override
  List<Object> get props => [appVersion];

  const AboutState({required this.appVersion});
}

class AboutInitial extends AboutState {
  const AboutInitial({required String appVersion}) : super(appVersion: appVersion);
}

class AboutFailure extends AboutState {
  const AboutFailure() : super(appVersion: '');
}
