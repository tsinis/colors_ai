import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/selected_api.dart';

extension StringSelectedApiExtension on SelectedAPI {
  String helperText(AppLocalizations l10n) {
    switch (this) {
      case SelectedAPI.colormind:
        return l10n.colormindApiDescription;
      case SelectedAPI.huemint:
        return l10n.huemintApiDescription;
    }
  }
}
