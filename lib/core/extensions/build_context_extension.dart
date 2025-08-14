import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
