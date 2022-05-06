import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  MaterialLocalizations get materialL10n => MaterialLocalizations.of(this);
  MediaQueryData get media => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
}
