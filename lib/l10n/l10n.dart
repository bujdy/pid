import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as app_localizations;
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  static final supportedLocales = [
    const Locale('cs'),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> localizationDelegates = [
    app_localizations.AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
