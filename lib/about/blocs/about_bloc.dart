import 'dart:async';

import 'package:stream_bloc/stream_bloc.dart';

import '../repository/about_repository.dart';
import 'about_event.dart';
import 'about_state.dart';

export 'about_event.dart';
export 'about_state.dart';

class AboutBloc extends StreamBloc<AboutEvent, AboutState> {
  final AboutRepository _aboutRepository;

  AboutBloc(this._aboutRepository) : super(const AboutState.initial());

  @override
  Stream<AboutState> mapEventToStates(AboutEvent event) async* {
    try {
      await event.when(
        started: _aboutRepository.init,
        googleTaped: _aboutRepository.openAboutGoogle,
        soundsTaped: _aboutRepository.openAboutSounds,
        huemintTaped: _aboutRepository.openAboutHuemint,
        sourceCodeTaped: _aboutRepository.openSourceCode,
        licensesTaped: _aboutRepository.openAboutLicenses,
        colormindTaped: _aboutRepository.openAboutColormind,
      );
    } catch (_) {
      yield const AboutState.failure();
    }

    yield AboutState.loaded(appVersion: _aboutRepository.version);
  }
}
