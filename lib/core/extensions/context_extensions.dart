import 'package:flutter/material.dart';

import '../../l10n/app_localizations.g.dart';

export '../../l10n/app_localizations.g.dart' show AppLocalizations;

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  MaterialLocalizations get materialL10n => MaterialLocalizations.of(this);
  MediaQueryData get media => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  // ignore: unnecessary-nullable, to match original [Navigator] pop method argument.
  void closeDialog<T>([T? result]) => Navigator.of(this).pop(result);
}
