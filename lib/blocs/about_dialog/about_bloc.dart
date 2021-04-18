import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/about_repository.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(const AboutCloseInitial());

  final AboutRepository _aboutRepository = AboutRepository();

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is AboutStarted) {
      _aboutRepository.initAppInfo();
    } else if (event is AboutClosed) {
      yield const AboutCloseInitial();
    } else if (event is AboutOpened) {
      yield AboutOpenInitial(appName: _aboutRepository.name, appVersion: _aboutRepository.version);
    } else if (event is AboutApiProviderTaped) {
      _aboutRepository.openAboutApi();
    } else if (event is AboutSourceCodeTaped) {
      _aboutRepository.openSourceCode();
    } else if (event is AboutSoundAssetsTaped) {
      _aboutRepository.openAboutSounds();
    } else if (event is AboutGoogleTaped) {
      _aboutRepository.openAboutGoogle();
    } else if (event is AboutLicenseTaped) {
      _aboutRepository.openAboutLicenses();
    }
  }
}
