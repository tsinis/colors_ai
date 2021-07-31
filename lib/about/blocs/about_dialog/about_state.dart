part of 'about_bloc.dart';

abstract class AboutState extends Equatable {
  const AboutState({required this.appVersion});

  final String appVersion;

  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {
  const AboutInitial({required String appVersion}) : super(appVersion: appVersion);
}

class AboutFailure extends AboutState {
  const AboutFailure() : super(appVersion: '');
}
