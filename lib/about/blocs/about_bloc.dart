import 'dart:async';

import 'package:bloc/bloc.dart';

import '../repository/about_repository.dart';
import 'about_event.dart';
import 'about_state.dart';

export 'about_event.dart';
export 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AboutRepository _aboutRepository;

  AboutBloc(this._aboutRepository) : super(const AboutState.initial());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
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
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      yield const AboutState.failure();
    }

    yield AboutState.loaded(appVersion: _aboutRepository.version);
  }
}
